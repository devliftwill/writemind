import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { createVideoFile } from '../../utils/createVideoFile';


export const imageOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/video-export/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          const basePath = 'stories/{docId}'
          const db = admin.firestore();
          let mp3File : string ='';
          let mp3back : string ='';
          const outputFile = `stories/${context.params.docId}/video/` + 'video.mp4';
          const pics: { path: string; timestamp: number }[] = [];
          const images =(await db.collection(`${basePath}/images`).get()).docs;
          images.forEach(async (doc) => {
            if (doc.exists) { 
               pics.push({ path: doc.data().image_url as string, timestamp: doc.data().seconds as number})
            }
          });

          const stories = (await db.collection(basePath).get()).docs;
          stories.forEach(async (doc) => {
            if (doc.exists) {
              mp3File = doc.data().audio;  
              mp3back = doc.data().background_audio_url;
           }
          })
          
          
          try {
           
            await createVideoFile (mp3File, mp3back, pics, outputFile);
            
                      
            // const videoExport = snapshot.data();
            return Promise.resolve();
          } catch (err) {
            return Promise.reject(err);
          }
        }
    );
