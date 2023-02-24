import * as functions from "firebase-functions";
import {createCompletion} from "../../utils/openai";
import textToSpeech from "@google-cloud/text-to-speech";
import fs from "fs";
// import util from "util";
import {saveToStorage} from "../../utils/file";
import {elevenlabsTextToSpeech} from "../../utils/elevenlabs";

export const storyOnCreate = functions.runWith({memory: "8GB", timeoutSeconds: 540}).firestore
    .document("stories/{docId}")
    .onCreate(
        async (
            snapshot: functions.firestore.DocumentSnapshot,
            context: functions.EventContext
        ) => {
          try {
            await snapshot.ref.update(
                {status: "Writeing content...", progress: 0.2}
            );

            const story = snapshot.data();


            const textStory = await createCompletion(`write a 4 pharagraph story about ${story?.text}`, context.params.docId);
            const text = textStory.data.choices[0].text?.trim();
            console.log(JSON.stringify(text));


            const xmlStory = await createCompletion(`use the following text ${text} and format 
            it as google text-to-speech SSML wrapped in a speak element with self closing mark elements at the beginning 
            and after each paragraph. The mark elements should contain an attribute called "name" 
            and the value of the attribute should be a description of an appropriate image representation for the paragraph below hyphen delimited.`, context.params.docId);
            const ssml = xmlStory.data.choices[0].text?.trim();
            console.log(JSON.stringify(ssml));


            const completionTitle = await createCompletion(`Create title for the following story ${story?.text}`, context.params.docId);

            let title = completionTitle.data.choices[0].text?.trim();
            title = title?.replace(/'/g, "").replace(/"/g, "");

            await snapshot.ref.update(
                {status: "Narrating...", progress: 0.3, title}
            );

            const client = new textToSpeech.v1beta1.TextToSpeechClient();

            const request = {
              input: {ssml},
              voice: {languageCode: "en-US", ssmlGender: "FEMALE"},
              audioConfig: {audioEncoding: "MP3"},
              enableTimePointing: ["SSML_MARK"],
            };
            const outputFile = `${context.params.docId}.mp3`;
            const tempPath = `/tmp/${outputFile}`;
            const [response]: any = await client.synthesizeSpeech(request as any);
            // const writeFile = util.promisify(fs.writeFile);
            // console.log("audio content", JSON.stringify(response));
            // await writeFile(tempPath, response.audioContent, "binary");


            const destinationPath = `audio/${context.params.storyId}/` + outputFile;

            // const audio = await saveToStorage(destinationPath, tempPath);


            // new ai models for speech Testing..
            const audioResp = await elevenlabsTextToSpeech(text as string, story?.voice_id || "21m00Tcm4TlvDq8ikWAM");
            const arrayBuffer = await audioResp.arrayBuffer();
            const buffer = Buffer.from(arrayBuffer);
            fs.writeFileSync(tempPath, buffer);


            const audio = await saveToStorage(destinationPath, tempPath);


            snapshot.ref.update(
                {audio, status: "Drawing illustrations...", progress: 0.7}
            );
            const imagesRef = snapshot.ref.collection("images");

            console.log("response.timepoints", JSON.stringify(response?.timepoints));

            let index = 0;
            for (const timepoint of response.timepoints) {
              console.log(`Mark: ${timepoint.markName}, Time: ${timepoint.timeSeconds}`);

              let text = timepoint.markName;
              text = text.replace(/-/g, " ").replace(/_/g, " ");

              await imagesRef.add({
                // TODO need a better way to define this
                text,
                created_date: new Date(),
                seconds: Math.round(timepoint.timeSeconds),
                volume: 0.2,
                is_cover: index === 0,
              });
              index++;
            }

            // Wait a few seconds for the while the images are saved to the server
            // TODO fix this

            setTimeout(()=>{
              snapshot.ref.update(
                  {audio, status: "Complete", progress: 1}
              );
            }, 3000);

            return Promise.resolve();
          } catch (err) {
            return Promise.reject(err);
          }
        }
    );
