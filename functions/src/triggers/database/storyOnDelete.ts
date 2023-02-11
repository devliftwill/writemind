import * as functions from "firebase-functions";


export const storyOnDelete = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{docId}")
    .onDelete(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          await deleteCollection("images", snapshot.ref);
          await deleteCollection("messages", snapshot.ref);

          return Promise.resolve();
        }
    );
