import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCTKO-aWUFy-X_3eQNdAm-T_aBN2Hb7Gfw",
            authDomain: "writemind-cd567.firebaseapp.com",
            projectId: "writemind-cd567",
            storageBucket: "writemind-cd567.appspot.com",
            messagingSenderId: "487162505750",
            appId: "1:487162505750:web:5f6c2b3efb8b884c3f6337",
            measurementId: "G-BB1G1MSTSS"));
  } else {
    await Firebase.initializeApp();
  }
}
