import * as functions from "firebase-functions";
import {createCompletion, createImage} from "../../utils/openai";
import textToSpeech from "@google-cloud/text-to-speech";
import fs from "fs";
import util from "util";
import {saveToStorage} from "../../utils/file";
import fetch from "node-fetch";

export const storyOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          try {
            await snapshot.ref.update(
                {status: "Writeing story...", progress: 0.2}
            );

            const story = snapshot.data();
            const completionStory = await createCompletion(`Write a story about ${story?.text} and format 
            it as google text-to-speech SSML wrapped in a speak element with mark elements at the beginning 
            and after each paragraph. The mark element should contain an attribute called "name" 
            that describes a photo illustration of the paragraph below.`, context.params.docId);
            const ssml = completionStory.data.choices[0].text?.trim();
            console.log(ssml);


            const completionTitle = await createCompletion(`Create title for the following story ${story?.text}`, context.params.docId);

            const title = completionTitle.data.choices[0].text?.trim();
            await snapshot.ref.update(
                {status: "Narrating...", progress: 0.3, title}
            );

            const client = new textToSpeech.TextToSpeechClient();

            const request = {
              input: {ssml},
              voice: {languageCode: story?.language_code || "en-US", ssmlGender: story?.ssml_gender.toUpperCase() || "FEMALE"},
              audioConfig: {audioEncoding: "MP3"},
              timePointType: "SSML_TIMEPOINT_TYPE_SSML_MARK",
            };
            const outputFile = `${context.params.docId}.mp3`;
            const tempPath = `/tmp/${outputFile}`;
            const [response]: any = await client.synthesizeSpeech(request as any);
            const writeFile = util.promisify(fs.writeFile);
            console.log("audio content", JSON.stringify(response));
            await writeFile(tempPath, response.audioContent, "binary");


            const destinationPath = `audio/${context.params.storyId}/` + outputFile;

            const audio = await saveToStorage(destinationPath, tempPath);
            snapshot.ref.update(
                {audio, status: "Drawing illustrations...", progress: 0.7}
            );
            const imagesRef = snapshot.ref.collection("images");

            console.log("response.timepoints", JSON.stringify(response?.timepoints));

            for (const timepoint of response.timepoints) {
              console.log(`Mark: ${timepoint.markName}, Time: ${timepoint.time}`);
              const imageRespoonse = await createImage(timepoint.markName);
              const image = imageRespoonse.data.data[0].url;
              const file = fs.createWriteStream(tempPath);

              const resp = await fetch(image as string);
              resp?.body?.pipe(file);


              await new Promise((resolve, reject) => {
                // after download completed close filestream
                file.on("finish", async () => {
                  file.close();
                  console.log("Download Completed");
                  const destinationPath = `stories/${context.params.storyId}/images/` + outputFile;
                  const url = await saveToStorage(destinationPath, tempPath);
                  // update with the storage page
                  imagesRef.add({
                    image_url: image,
                    text: timepoint.markName,
                    created_date: new Date(),
                    seconds: timepoint.time,
                  });

                  resolve(url);
                });
              });
            }

            // set the cover photo
            const firstImage = (await imagesRef.limit(1).get()).docs[0].data();

            snapshot.ref.update(
                {audio, status: "Complete", progress: 1, cover: firstImage.image_url}
            );


            return Promise.resolve();
          } catch (err) {
            return Promise.reject(err);
          }
        }
    );
