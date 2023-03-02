import * as admin from "firebase-admin";
import fs from "fs";
import fetch from "node-fetch";
export const saveToStorage = async (path: string, tempPath: string) => {
  // const destinationPath = `audio/${context.params.storyId}/` + outputFile;

  const storagePath = "gs://writemind-cd567.appspot.com";
  const storageRef = admin.storage().bucket(storagePath);
  const file = storageRef.file(path);

  return new Promise(function (resolve, reject) {
    // TODO: rewrite this mess
    fs.open(tempPath, "r", function (err, fileToRead) {
      if (!err) {
        fs.readFile(fileToRead, async function (err, data) {
          if (!err) {
            await file
              .save(data)
              .then((stuff) => {
                return file.getSignedUrl({
                  action: "read",
                  expires: "03-09-2500",
                });
              })
              .then((urls) => {
                const url = urls[0];
                console.log(`Media url = ${url}`);
                resolve(url);
              })
              .catch((err) => {
                console.log(`Unable to upload media ${err}`);
                reject(err);
              });
          } else {
            console.log(err);
            reject(err);
          }
        });
      } else {
        console.log(err);
        reject(err);
      }
    });
  });
};

export const convertToFile = async (
  url: string,
  localPath: string
): Promise<string> => {
  const file = fs.createWriteStream(localPath);
  const resp = await fetch(url as string);

  resp?.body?.pipe(file);

  return new Promise((resolve, reject) => {
    resp?.body?.pipe(file);

    // after download completed close filestream
    file.on("finish", async () => {
      resolve(localPath);
    });
  });
};
