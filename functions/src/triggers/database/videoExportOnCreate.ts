import * as functions from "firebase-functions";
import {createVideoFile} from "../../utils/createVideoFile";


export const imageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/video-export/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          try {
            console.log("video url", await createVideoFile(`${context.params.docId}`));


            // const videoExport = snapshot.data();
            return Promise.resolve();
          } catch (err) {
            return Promise.reject(err);
          }
        }
    );
