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
            await snapshot.ref.update({status: "Complete", videoURL: videoURL});
            // console.log("first", videoExport?.story_ref)
            const storySnapshot = await videoExport?.story_ref.get();
            // const story = storySnapshot.data();
           
            storySnapshot.ref.update({
              video_url: videoURL,
            });
            return Promise.resolve();
          } catch (err) {
            return Promise.reject(err);
          }
        }
    );
