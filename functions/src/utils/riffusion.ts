import fetch from "node-fetch";
import * as functions from "firebase-functions";

export const getPredictions = async (prompt: string, denoising = 0.75) => {
  return fetch("https://api.replicate.com/v1/predictions", {
    method: "post",
    body: JSON.stringify({
      "version": "8cf61ea6c56afd61d8f5b9ffd14d7c216c0a93844ce2d82ac1c9ecc9c7f24e05",
      "input": {
        "prompt_a": prompt,
        "denoising": denoising,
      },
    }),
    headers: {"Content-Type": "application/json", "Authorization": `Token ${functions.config().replicate.apikey}`},
  });
};


export const getMusic = async (url: string) => {
  return fetch(url, {
    method: "get",
    headers: {"Content-Type": "application/json", "Authorization": `Token ${functions.config().replicate.apikey}`},
  });
};
