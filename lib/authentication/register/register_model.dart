import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtNum widget.
  FocusNode? txtNumFocusNode;
  TextEditingController? txtNumController;
  String? Function(BuildContext, String?)? txtNumControllerValidator;
  DateTime? datePicked;
  // State field(s) for txtPassword widget.
  FocusNode? txtPasswordFocusNode;
  TextEditingController? txtPasswordController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordControllerValidator;
  // State field(s) for txtConfirm widget.
  FocusNode? txtConfirmFocusNode;
  TextEditingController? txtConfirmController;
  late bool txtConfirmVisibility;
  String? Function(BuildContext, String?)? txtConfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtPasswordVisibility = false;
    txtConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtNumFocusNode?.dispose();
    txtNumController?.dispose();

    txtPasswordFocusNode?.dispose();
    txtPasswordController?.dispose();

    txtConfirmFocusNode?.dispose();
    txtConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
