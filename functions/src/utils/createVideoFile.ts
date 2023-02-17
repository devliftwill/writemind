import * as admin from 'firebase-admin';
import * as ffmpeg from 'fluent-ffmpeg';

const bucket = admin.storage().bucket();

export async function createVideoFile(
  path2mp3: string,
  backGoundMP3: string,
  imagesArray: { path: string; timestamp: number }[],
  outputFilePath: string
) {
  await createVideo(path2mp3, backGoundMP3, imagesArray, outputFilePath);
}

// ---------- Download from storage ----------------------
async function downloadFile(path: string): Promise<string> {
  const file = bucket.file(path);
  const destination = path.split('/').pop();

  await file.download({ destination });

  return destination as string;
}

// ---------- Create Video ----------------------
async function createVideo(
  mp3Path: string,
  bgMp3Path: string,
  images: { path: string; timestamp: number }[],
  outputFilePath: string
): Promise<void> {
  const mp3 = await downloadFile(mp3Path);
  const bgMp3 = await downloadFile(bgMp3Path);

  const inputs: any[] = [];

  images.forEach((image) => {
    const path = image.path;
    const timestamp = image.timestamp;
    const output = `${timestamp}.png`;

    inputs.push(
      `-loop 1 -t 1 -i ${path} -vframes 1 -filter_complex "drawtext=fontfile=Arial.ttf:text='${timestamp}':fontcolor=white:fontsize=20:x=10:y=10" ${output}`
    );
  });

  const ffmpegCommand = new ffmpeg.FfmpegCommand();

  inputs.forEach((input) => {
    ffmpegCommand.input(input);
  });

  ffmpegCommand
    .inputOptions('-framerate 1')
    .input(bgMp3)
    .audioFilter('volume-0.5')
    .input(mp3)
    .complexFilter([
      `overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2:shortest=1`,
      `amix=inputs=2:duration=longest:dropout_transition=3`,
    ])
    .output(outputFilePath)
    .on('end', () => {
      console.log('Video created successfully');
    })
    .on('error', (err: any) => {
      console.error(`Error creating video: ${err.message}`);
    })
    .run();
}
