import * as admin from "firebase-admin";
admin.initializeApp();
export {messageOnUpdate} from "./triggers/database/messageOnUpdate";
export {imageOnWrite} from "./triggers/database/imageOnWrite";
export {userOnDelete} from "./triggers/database/userOnDelete";
export {storyOnDelete} from "./triggers/database/storyOnDelete";
export {storyOnCreate} from "./triggers/database/storyOnCreate";
export {videoExportOnCreate} from "./triggers/database/videoExportOnCreate";
