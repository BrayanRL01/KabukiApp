// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<DocumentReference> createNewAdmin(
  String userName,
  DateTime birthDate,
  String email,
  String docRandomGen,
  String password,
  String phoneNumber,
) async {
  DateTime createdTime = DateTime.now();

  final firestore = FirebaseFirestore.instance;

  FirebaseApp app = await Firebase.initializeApp(
      name: docRandomGen, options: Firebase.app().options);

  UserCredential credential = await FirebaseAuth.instanceFor(app: app)
      .createUserWithEmailAndPassword(email: email, password: password);

  String? userId = credential.user?.uid;

  final CollectionReference<Map<String, dynamic>> userRef =
      FirebaseFirestore.instance.collection('users');

  userRef.doc(userId).set({
    "email": email,
    "display_name": userName,
    "phone_number": phoneNumber,
    "uid": userId,
    "role": 'Admin',
    "created_time": createdTime,
  });

  final collectionUsersRef = firestore.collection('users');
  final userFound =
      await collectionUsersRef.where('uid', isEqualTo: userId).get();

  UsersRecord user = await UsersRecord.fromSnapshot(userFound.docs[0]);

  DocumentReference userReference =
      FirebaseFirestore.instance.doc('/users/' + user.uid);
  return userReference;
}
