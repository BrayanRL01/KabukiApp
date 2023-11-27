// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';

Future<String> createAppointment(
    DateTime appointmentTime, String message) async {
  FirebaseFirestore.instance.collection('appointments').add({
    'appointment_date': appointmentTime,
    'status': 'Disponible',
  }).then((value) {
    message = "Cita Agregada";
  }).catchError((error) {
    message = "Failed to add cita: $error";
  });
  return message;
}
