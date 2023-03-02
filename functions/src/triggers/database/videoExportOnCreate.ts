import * as functions from "firebase-functions";
import {createVideoFile} from "../../utils/createVideoFile";


export const videoExportOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("video_exports/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          try {
            const videoExport = snapshot.data();
            const videoURL = await createVideoFile(videoExport?.story_ref);
            await snapshot.ref.update({status: "Created", videoURL: videoURL});
            console.log("video url", videoURL);
            // const videoExport = snapshot.data();
            return Promise.resolve();
          } catch (err) {
            return Promise.reject(err);
          }
        }
    );
