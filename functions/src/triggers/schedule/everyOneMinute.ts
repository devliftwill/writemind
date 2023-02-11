import * as functions from "firebase-functions";
import {getMusic} from "../../utils/riffusion";
import * as admin from "firebase-admin";

export const everyOneMinute = functions.runWith({memory: "8GB", timeoutSeconds: 540}).pubsub
    .schedule("every 1 minutes")
    .onRun(async () => {
      const db = admin.firestore();
      const audioQueueRef = db.collection("audio_queue");
      const snapshot = (await audioQueueRef.get()).docs;

      snapshot.forEach(async (snap)=>{
        const queueItem = snap.data();
        const response = await getMusic(queueItem.url);
        const {status, output} = await response.json();
        if (status === "succeeded") {
          queueItem.story_ref.update({
            "background_audio": output.audio,
          });
          snap.ref.delete();
        }
      });
    });
