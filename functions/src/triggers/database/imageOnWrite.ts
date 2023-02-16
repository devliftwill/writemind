import * as functions from "firebase-functions";
import {createImage} from "../../utils/openai";
import fs from "fs";
import fetch from "node-fetch";
import {saveToStorage} from "../../utils/file";
import {Change} from "firebase-functions";
import {DocumentSnapshot} from "firebase-functions/v1/firestore";


export const imageOnWrite = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/images/{docId}")
    .onWrite(
        async (
            change: Change<DocumentSnapshot>,
            context: functions.EventContext
        ) => {
          try {
            // onlly update image if it does no already exist
            const after = change.after;
            const imagedoc = after.data();
            console.log("imagedoc", JSON.stringify(imagedoc));
            if (imagedoc && !imagedoc.image_url) {
              const outputFile = `${context.params.docId+ new Date().valueOf()}.png`;
              const tempPath = `/tmp/${outputFile}`;

              console.log("imagedoc", JSON.stringify(imagedoc));

              console.log("starting createImage");
              const response = await createImage(imagedoc?.text);
              const image = response.data.data[0].url;
              console.log("image", image);
              change.after.ref.update({"image_url": image});

              // save the image to storage

              const file = fs.createWriteStream(tempPath);
              const resp = await fetch(image as string);

              resp?.body?.pipe(file);

              return new Promise((resolve, reject) => {
              // after download completed close filestream
                file.on("finish", async () => {
                  file.close();
                  console.log("Download Completed");
                  const destinationPath = `stories/${context.params.storyId}/images/` + outputFile;
                  const url = await saveToStorage(destinationPath, tempPath);
                  // update with the storage page
                  await after.ref.update({"image_url": url});

                  if (imagedoc.is_cover) {
                    // set the cover
                    await after.ref.parent.parent?.update({cover: url});
                  }

                  resolve(url);
                });
              });
            } else {
              return Promise.resolve();
            }
          } catch (err) {
            console.log(JSON.stringify(err));
            return Promise.reject(err);
          }
        }
    );
