const deleteCollection = async (path: string, ref: FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData>) =>{
  const docs = (await ref.collection(path).get()).docs;
  for (const doc of docs) {
    await doc.ref.delete();
  }
  Promise.resolve();
};
