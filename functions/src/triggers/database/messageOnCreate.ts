import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {createCompletion} from "../../utils/openai";

export const messageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/messages/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          const message = snapshot.data();

          if (message && message.sender_ref) {
            const completion = await createCompletion(message.text, context.params.docId);
            console.log(JSON.stringify(completion.data));

            const db = admin.firestore();
            const messageDoc = {
              "text": completion.data.choices[0].text?.trim(),
              "created_date": new Date(),
            };
            return db.collection("stories").doc(context.params.storyId).collection("messages").add(messageDoc);
          }

          return Promise.resolve();
        }
    );
