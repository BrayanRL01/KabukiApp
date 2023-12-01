// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

class WhatsAppRedirect extends StatefulWidget {
  const WhatsAppRedirect({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WhatsAppRedirectState createState() => _WhatsAppRedirectState();
}

class _WhatsAppRedirectState extends State<WhatsAppRedirect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElevatedButton(
        onPressed: () async {
          var whatsappUrl = "whatsapp://send?phone=+50685208604";
          await canLaunch(whatsappUrl)
              ? launch(whatsappUrl)
              : print(
                  "open WhatsApp app link or do a snackbar with notification that there is no WhatsApp installed");
        },
        child: Text('Reservar Cita'),
      ),
    );
  }
}
