import {Configuration, OpenAIApi} from "openai";
import * as functions from "firebase-functions";

const configuration = new Configuration({
  apiKey: functions.config().openai.apikey,
});
const openai = new OpenAIApi(configuration);

export const createCompletion = async (prompt: string, user:string) => {
  return openai.createCompletion({
    model: "text-davinci-002",
    max_tokens: 1000,
    prompt,
    user,
  });
};


export const createImage = async (prompt: string, user:string) => {
  return openai.createImage({
    n: 1,
    size: "256x256",
    prompt,
    user,
  });
};
