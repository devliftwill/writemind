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
            // get the last message so that we have context.
            const lastNessageSnap = await snapshot.ref.parent
                .where("is_ai", "==", true)
                .orderBy("created_date", "desc")
                .limit(1)
                .get();

            let lastMessage = "";

            if (!lastNessageSnap.empty) {
              lastMessage = lastNessageSnap.docs[0].data().text;
            }

            console.log("lastMessage", lastMessage);


            const completion = await createCompletion(`${message.text} and use the following  as context: ${lastMessage}`, context.params.docId);
            console.log(JSON.stringify(completion.data));

            const db = admin.firestore();


            const messageDoc = {
              "text": completion.data.choices[0].text?.trim(),
              "created_date": new Date(),
              "is_ai": true,
            };
            return db.collection("stories").doc(context.params.storyId).collection("messages").add(messageDoc);
          }

          return Promise.resolve();
        }
    );
