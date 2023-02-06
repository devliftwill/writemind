import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import fs from "fs";
import util from "util";
import textToSpeech from "@google-cloud/text-to-speech"; // Imports the Google Cloud client library

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

            const destinationPath = `audio/${context.params.storyId}/` + outputFile;

            const storagePath = "gs://writemind-cd567.appspot.com";
            const storageRef = admin.storage().bucket(storagePath);
            const file = storageRef.file(destinationPath);


            const request = {
              input: {text: message.text},
              voice: {languageCode: "en-US", ssmlGender: "FEMALE"},
              audioConfig: {audioEncoding: "MP3"},
            };
            const tempPath = `/tmp/${outputFile}`;
            const [response]: any = await client.synthesizeSpeech(request as any);
            const writeFile = util.promisify(fs.writeFile);
            await writeFile(tempPath, response.audioContent, "binary");


            // TODO: rewrite this mess
            fs.open(tempPath, "r", function(err, fileToRead) {
              if (!err) {
                fs.readFile(fileToRead, async function(err, data) {
                  if (!err) {
                    await file.save(data).then((stuff) => {
                      return file.getSignedUrl({
                        action: "read",
                        expires: "03-09-2500",
                      });
                    })
                        .then((urls) => {
                          const url = urls[0];
                          console.log(`Media url = ${url}`);
                          const db = admin.firestore();
                          const storyDoc = {
                            "audio": url,
                          };
                          return db.collection("stories").doc(context.params.storyId).update(storyDoc);
                        })
                        .catch((err) => {
                          console.log(`Unable to upload media ${err}`);
                        });
                  } else {
                    console.log(err);
                  }
                });
              } else {
                console.log(err);
              }
            });
          }

          return Promise.resolve();
        }
    );
