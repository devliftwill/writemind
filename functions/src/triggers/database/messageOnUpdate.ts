import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import fs from "fs";
import util from "util";
import textToSpeech from "@google-cloud/text-to-speech"; // Imports the Google Cloud client library
import {saveToStorage} from "../../utils/file";

export const messageOnUpdate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{storyId}/messages/{docId}")
    .onUpdate(
        async (
            snapshot: functions.Change<functions.firestore.DocumentSnapshot>,
            context: functions.EventContext,
        ) => {
          const message = snapshot.after.data();
          const outputFile = `${context.params.docId}.mp3`;
          if (message && message.convert_to_audio) {
            const client = new textToSpeech.TextToSpeechClient();

            const request = {
              input: {text: message.text},
              voice: {languageCode: "en-US", ssmlGender: "FEMALE"},
              audioConfig: {audioEncoding: "MP3"},
            };
            const tempPath = `/tmp/${outputFile}`;
            const [response]: any = await client.synthesizeSpeech(request as any);
            const writeFile = util.promisify(fs.writeFile);
            await writeFile(tempPath, response.audioContent, "binary");


            const destinationPath = `audio/${context.params.storyId}/` + outputFile;
            const db = admin.firestore();
            const url = await saveToStorage(destinationPath, tempPath);
            const storyDoc = {
              "audio": url,
            };
            return db.collection("stories").doc(context.params.storyId).update(storyDoc);
          } else {
            return Promise.resolve();
          }
        }
    );
