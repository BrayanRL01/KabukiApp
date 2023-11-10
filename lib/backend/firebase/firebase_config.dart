import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBLo28K8T-AJv1SO6qyC3Qbzi-dGGwx0ig",
            authDomain: "kabukidb-e0898.firebaseapp.com",
            projectId: "kabukidb-e0898",
            storageBucket: "kabukidb-e0898.appspot.com",
            messagingSenderId: "1065363029512",
            appId: "1:1065363029512:web:2e28ef1dcf2fec32c59bbd",
            measurementId: "G-7F818XCWPL"));
  } else {
    await Firebase.initializeApp();
  }
}
