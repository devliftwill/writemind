import * as functions from "firebase-functions";
import {createImage, createImageEdit} from "../../utils/openai";
import fs from "fs";
import fetch from "node-fetch";
import {convertToFile, saveToStorage} from "../../utils/file";


export const imageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/images/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          try {
            const imagedoc = snapshot.data();
            const outputFile = `${context.params.docId}.png`;
            const tempPath = `/tmp/${outputFile}`;

            console.log("imagedoc", JSON.stringify(imagedoc));

            let response;
            let image;
            if (imagedoc?.image_url && imagedoc?.mask) {
              image = imagedoc?.image_url;
              console.log("starting createImageEdit");
              const maskFile = `mask_${context.params.docId}.png`;
              const imageStream = fs.createReadStream(await convertToFile(imagedoc?.image_url, tempPath));
              const maskStream = fs.createReadStream(await convertToFile(imagedoc?.mask, `/tmp/${maskFile}`));
              console.log("image edit started");

              response = await createImageEdit(imagedoc?.text, imageStream as any, maskStream as any);

              image = response.data.data[0].url;
              console.log("image edit", image);
            } else {
              console.log("starting createImage");
              response = await createImage(imagedoc?.text);
              image = response.data.data[0].url;
              console.log("image", image);
            }
            console.log("Do we get here?");
            snapshot.ref.update({"image_url": image});

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
                await snapshot.ref.update({"image_url": url});


                const countSnap = await snapshot.ref.parent.get();

                if (countSnap.docs.length === 1) {
                  // set the cover
                  await snapshot.ref.parent.parent?.update({cover: url});
                }

                resolve(url);
              });
            });
          } catch (err) {
            console.log(JSON.stringify(err));
            return Promise.reject(err);
          }
        }
    );
