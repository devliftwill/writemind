import { Configuration, OpenAIApi } from "openai";
import * as functions from "firebase-functions";

const configuration = new Configuration({
  apiKey: functions.config().openai.apikey,
  organization: "org-kYVLT7aY235TZzYHfCZVw7vV",
});
const openai = new OpenAIApi(configuration);

export const createCompletion = async (prompt: string, user: string) => {
  // return openai.createCompletion({
  //   model: "text-davinci-003",
  //   max_tokens: 1000,
  //   prompt,
  //   user,
  // });

  return openai.createChatCompletion({
    model: "gpt-3.5-turbo",
    messages: [{ role: "user", content: prompt }],
  });
};

export const createImage = async (prompt: string) => {
  return openai.createImage({
    n: 1,
    size: "512x512",
    // TODO: we need a better way to stye this
    prompt: `3D render ${prompt} digital art photo-realistic, concept art, intricate details, highly detailed 8k`,
  });
};

// export const createImageEdit = async (prompt: string, image:File, mask:File) => {
//   return openai.createImageEdit(
//       image,
//       mask,
//       prompt,
//       1,
//       "512x512",
//   );
// };
