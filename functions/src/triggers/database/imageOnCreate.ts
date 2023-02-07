import * as functions from "firebase-functions";
import {createImage} from "../../utils/openai";
import fs from "fs";
import fetch from "node-fetch";
import {saveToStorage} from "../../utils/file";

export const imageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/images/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          const imagedoc = snapshot.data();


          const response = await createImage(imagedoc?.text, context.params.storyId);

          const image = response.data.data[0].url;

          // save the image to storage

          const outputFile = `${context.params.docId}.png`;
          const tempPath = `/tmp/${outputFile}`;
          const file = fs.createWriteStream(tempPath);
          const resp = await fetch(image as string);

          resp?.body?.pipe(file);

          // after download completed close filestream
          file.on("finish", async () => {
            file.close();
            console.log("Download Completed");
            const destinationPath = `stories/${context.params.storyId}/images/` + outputFile;
            const url = await saveToStorage(destinationPath, tempPath);
            // update with the storage page
            snapshot.ref.update({"image_url": url});


            const countSnap = await snapshot.ref.parent.get();

            if (countSnap.docs.length === 1) {
            // set the cover
              snapshot.ref.parent.parent?.update({cover: url});
            }
          });


          // temp path so that we can render quickly in the UI
          return snapshot.ref.update({"image_url": image});
        }
    );
