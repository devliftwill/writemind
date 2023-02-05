import * as functions from "firebase-functions";
import {auth} from "firebase-admin";
import {DocumentSnapshot} from "firebase-functions/v1/firestore";
import {EventContext} from "firebase-functions";

export const userOnDelete = functions.firestore
    .document("/users/{docId}")
    .onDelete(async (snapshot: DocumentSnapshot, context: EventContext) => {
      return auth().deleteUser(context.params.docId);
    });
