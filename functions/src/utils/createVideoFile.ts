// import {tmpdir} from "os";
// import {join} from "path";
// import ffmpeg from 'fluent-ffmpeg';
// import { promisify } from 'util';
// import ffmpegPath from 'ffmpeg-static';
// import { saveToStorage } from './file';

// import { Movie, Scene } from 'json2video-sdk';

// eslint-disable-next-line no-console
const {Movie, Scene} = require("json2video-sdk");

// import fs from "fs";

// const bucket = admin.storage().bucket();
export async function createVideoFile(
    storyRef: FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData>
) {
  let mp3File = "";
  let mp3back = "";
  const pics: { path: string; timestamp: number }[] = [];
  const images = (await storyRef.collection("images").get()).docs;

  images.forEach((doc) => {
    if (doc.exists) {
      pics.push({
        path: doc.data().image_url as string,
        timestamp: doc.data().seconds as number,
      });
    }
  });

  const storySnapshot = await storyRef.get();
  const story = storySnapshot.data();
  try {
    if (storySnapshot.exists && story) {
      mp3File = story.audio;
      mp3back = story.background_audio_url;

      await createVideo(mp3File, mp3back, pics);
    }
    return Promise.resolve();
  } catch (err) {
    return Promise.reject(err);
  }
}

export async function createVideo(
    mp3Path: string,
    bgMp3Path: string,
    images: { path: string; timestamp: number }[]
): Promise<string> {
  const movie = new Movie();
  movie.setAPIKey("UiwQfPpVV73YE98RZVE4N5fBoG7TGOHuaKhCwnca");
  movie.set("resolution", "full-hd");
  movie.set("quality", "high");
  movie.set("draft", false);
  console.log("mp3Path", mp3Path);
  console.log("bgMp3Path", bgMp3Path);
  // Create SCENE 1
  const scene1 = new Scene();

  scene1.addElement({
    type: "voice",
    src: mp3Path,
    muted: false,
    volume: 9,
    text: "",
  });

  scene1.addElement({
    type: "audio",
    src: bgMp3Path,
    muted: false,
    volume: 4,
    text: "",
  });

  images.forEach((image) => {
    scene1.addElement({
      type: "image",
      src: image.path,
      start: image.timestamp,
      text: "",
    });
    console.log("images", image.path);
  });

  movie.addScene(scene1);

  const render = await movie.render();
  console.log("movie.render", render);

  try {
    const status = await movie.waitToFinish((res: any) => {
      console.log("Rendering: ", res.movie.status, " / ", res.movie.message);
    });
    console.log("Movie is ready: ", status.movie.url);
    return status.movie.url;
  } catch (err) {
    console.log("Error: ", err);
    return "error";
  }
}
// ---------- Create Video ----------------------
/*
//ffmpeg
export async function createVideo(
    mp3Path: string,
    bgMp3Path: string,
    images: { path: string; timestamp: number }[],
): Promise<string> {
  ffmpeg.setFfmpegPath(ffmpegPath as string);
  console.log("path 2 ffMpeg static", ffmpegPath);
  // const bucket = admin.storage().bucket();
  const mp3 = mp3Path; // await downloadFile(mp3Path);
  const bgMp3 = bgMp3Path; // await downloadFile(bgMp3Path);
  const outputPath = "/tmp/video.mp4";
  // if (!fs.existsSync("tmp/video")) {
  //  fs.mkdirSync("tmp/video", {recursive: true});
  //}
  const inputs: any[] = [];

  images.forEach((image) => {
    const path = image.path;
    const timestamp = image.timestamp;
    const outputPicFileName = `${timestamp}.png`;
    // console.log("url to pictures", image.path);
    inputs.push(
        `-loop 1 -t 1 -i ${path} -vframes 1 -filter_complex "drawtext=fontfile=Arial.ttf:text='${timestamp}':fontcolor=white:fontsize=20:x=10:y=10" ${outputPicFileName}`
    );
  });
  const command = ffmpeg();
  inputs.forEach((input) => {
    // ffmpegCommand().input(input);
  });

  // ffmpegCommand().inputOptions("-framerate 1");
  command.input(bgMp3);
  command.audioFilter("volume-0.5");
  command.input(mp3);
  command.complexFilter([
    "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:shortest=1",
    "amix=inputs=2:duration=longest:dropout_transition=3",
  ]);
  const tempFilePath = outputPath;
  command.on("end", () => {
    console.log("Video created successfully");
  })
      .on("error", (err: any) => {
        console.error(`Error creating video: ${err.message}`);
      });

  // Run the ffmpeg command
  const runCommand = promisify(command.run).bind(command);
  await runCommand();

  // Upload the video file to Firebase Storage
  const fileName = outputPath.split("/").pop() || "video.mp4";
  const destination = `videos/${fileName}`;
  const publicUrl = await saveToStorage(destination, tempFilePath);
  return publicUrl as string;
}

 */
/* async function createVideo(
  mainAudioPath: string,
  backgroundAudioPath: string,
  pictures: { path: string; timestamp: number }[],
  outputFilePath: string
) {
  const command = ffmpeg();

  // Add background audio to the video
  command.input(backgroundAudioPath).inputOptions("-stream_loop -1");

  // Add pictures to the video
  for (const picture of pictures) {
    command.input(picture.path).inputOptions(`-t ${picture.timestamp}`);
  }

  // Add main audio to the video
  command.input(mainAudioPath);

  // Create a complex filtergraph to overlay the pictures with timestamps and main audio
  let filtergraph = "[0:a]atrim=end=15, asetpts=PTS-STARTPTS[a0];";
  for (let i = 0; i < pictures.length; i++) {
    filtergraph += `[${i + 1}:v]setpts=PTS-STARTPTS+${15 + i * pictures[i].timestamp}/TB, scale=1280x720,
    drawtext=fontfile=/path/to/font.ttf:text='${i + 1}':x=50:y=50:fontsize=24:fontcolor=white, trim=end=${15 + (i + 1) * pictures[i].timestamp}, setpts=PTS-STARTPTS+${15 +
      i * pictures[i].timestamp}/TB, [v${i}];`;
  }
  filtergraph += `[a0][v0] [v1] [v2] [v3] [v4] [v5] [v6] [v7] [v8] [v9] [v10] [v11] [v12] [v13] [v14] [v15] [v16] [v17] [v18]
  [v19] [v20] [v21] [v22] [v23] [v24] [v25] [v26] [v27] [v28] [v29] [v30] [v31] [v32] [v33] [v34] [v35] [v36] [v37] [v38] [v39]
  [v40] [v41] [v42] [v43] [v44] [v45] [v46] [v47] [v48] [v49] [v50] [v51] [v52] [v53] [v54] [v55] [v56] [v57] [v58] [v59] [v60] [v61]
  [v62] [v63] [v64] [v65] [v66] [v67] [v68] [v69] [v70] [v71] [v72] [v73] [v74] [v75] [v76] [v77], concat=n=${pictures.length + 1}:v=1:a=1 [v] [a]`;

  command.complexFilter(filtergraph);

  // Set the video codec and output format
  command.videoCodec("libx264").format("mp4");

  // Set the output file path and run the command
  command.output(outputFilePath);
  const runCommand = promisify(command.run).bind(command);
  await runCommand();
  }
 */
/* function downloadFileFromURL(downloadUrl: string) {
  return new Promise((resolve, reject) => {
    // Create a buffer to store the file contents
    let fileBuffer = Buffer.alloc(0);
    // Create a readable stream from the HTTP response
    fetch(downloadUrl)
        .then((response) => {
          const stream = response.body;
          stream.on("data", (chunk) => {
          // Append the current chunk to the buffer
            fileBuffer = Buffer.concat([fileBuffer, chunk]);
          })
              .on("end", () => {
                // Convert the file buffer to a Base64-encoded string
                const fileBase64 = fileBuffer.toString("base64");
                // Resolve the promise with the Base64-encoded string
                resolve(fileBase64);
              })
              .on("error", (err) => {
                // Reject the promise with the error
                console.log("error 1");
                reject(err);
              });
        })
        .catch((error) => {
        // Reject the promise with the error
          console.log("error 2");
          reject(error);
        });
  });
}
 */
