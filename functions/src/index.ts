import admin = require("firebase-admin");
export {messageOnCreate} from "./triggers/database/messageOnCreate";
export {messageOnUpdate} from "./triggers/database/messageOnUpdate";
export {imageOnCreate} from "./triggers/database/imageOnCreate";
export {userOnDelete} from "./triggers/database/userOnDelete";
admin.initializeApp();
