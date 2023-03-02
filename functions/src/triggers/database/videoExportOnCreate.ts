import * as functions from "firebase-functions";

export const imageOnCreate = functions
  .runWith({ memory: "8GB", timeoutSeconds: 540 })
  .firestore.document("stories/video-export/{docId}")
  .onCreate(
    async (
      snapshot: functions.firestore.DocumentSnapshot,
      context: functions.EventContext
    ) => {
      try {
        // const videoExport = snapshot.data();
        return Promise.resolve();
      } catch (err) {
        return Promise.reject(err);
      }
    }
  );
