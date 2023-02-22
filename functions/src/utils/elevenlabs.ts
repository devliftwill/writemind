import fetch from "node-fetch";
import * as functions from "firebase-functions";

export const elevenlabsTextToSpeech = async (text:string, voiceId: string) => {
  return fetch(`https://api.elevenlabs.io/v1/text-to-speech/${voiceId}`, {
    method: "post",
    body: JSON.stringify({
      text,
      "voice_settings": {
        "stability": 0,
        "similarity_boost": 0,
      },
    }),
    headers: {
      "accept": "audio/mpeg",
      "xi-api-key": functions.config().elevenlabs.apikey,
      "Content-Type": "application/json",
    },
  });
};

