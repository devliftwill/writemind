import * as functions from "firebase-functions";
import {Configuration, OpenAIApi} from "openai";
import * as admin from "firebase-admin";

export const messageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/messages/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          const message = snapshot.data();

          if (message && message.sender_ref) {
            const configuration = new Configuration({
              apiKey: functions.config().openai.apikey,
            });

            const openai = new OpenAIApi(configuration);
            const completion = await openai.createCompletion({
              model: "text-davinci-002",
              prompt: message.text,
            });
            console.log(JSON.stringify(completion.data));

            const db = admin.firestore();
            const messageDoc = {
              "text": completion.data.choices[0].text,
              "created_date": new Date(),
            };
            return db.collection("stories").doc(context.params.storyId).collection("messages").add(messageDoc);
          }

          return Promise.resolve();
        }
    );
