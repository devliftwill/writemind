import * as functions from "firebase-functions";
import {createImage} from "../../utils/openai";

export const imageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/images/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          const imagedoc = snapshot.data();

          if (imagedoc) {
            const response = await createImage(imagedoc.text, context.params.storyId);

            const image = response.data.data[0].url;
            return snapshot.ref.update({"image_url": image});

            // add a message

            // const db = admin.firestore();
            // const messageDoc = {
            //   "text": imagedoc.text,
            //   "created_date": new Date(),
            // };
            // return db.collection("stories").doc(context.params.storyId).collection("messages").add(messageDoc);
          }
          return Promise.resolve();
        }
    );
