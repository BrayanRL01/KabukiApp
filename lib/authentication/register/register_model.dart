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
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  String? _txtNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '720mj4c9' /* Su nombre es requerido. */,
      );
    }

    if (val.length > 40) {
      return FFLocalizations.of(context).getText(
        'l5c57wia' /* El maximo de caracteres es de ... */,
      );
    }

    return null;
  }

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  String? _txtEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hp9ier30' /* Su correo electrónico es reque... */,
      );
    }

    if (val.length > 40) {
      return FFLocalizations.of(context).getText(
        'eixye28o' /* El máximo de caracteres es de ... */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'il9qgl3o' /* Debe ser un correo electrónico... */,
      );
    }
    return null;
  }

  // State field(s) for txtNum widget.
  FocusNode? txtNumFocusNode;
  TextEditingController? txtNumController;
  String? Function(BuildContext, String?)? txtNumControllerValidator;
  String? _txtNumControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't4c1gxt9' /* El número de teléfono es reque... */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'tokkvkz2' /* Solo se permiten 8 dígitos. */,
      );
    }
    if (val.length > 8) {
      return FFLocalizations.of(context).getText(
        '66rpaa7f' /* Solo se permiten 8 dígitos. */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for txtPassword widget.
  FocusNode? txtPasswordFocusNode;
  TextEditingController? txtPasswordController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordControllerValidator;
  String? _txtPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bzd5xgl0' /* La contraseña es requerida. */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'p5jqapmd' /* Debe tener 8 caracteres. */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'al86tsjs' /* Ha llegado a los 20 caracteres... */,
      );
    }
    if (!RegExp('^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\\\$&*~]).{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'fd2i2xth' /* Su contraseña debe contener 8 ... */,
      );
    }
    return null;
  }

  // State field(s) for txtConfirm widget.
  FocusNode? txtConfirmFocusNode;
  TextEditingController? txtConfirmController;
  late bool txtConfirmVisibility;
  String? Function(BuildContext, String?)? txtConfirmControllerValidator;
  String? _txtConfirmControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5i5xpqj3' /* La contraseña es requerida. */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'l7ip4f3s' /* Debe tener 8 caracteres. */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'um1e6sju' /* Ha llegado a los 20 caracteres... */,
      );
    }
    if (!RegExp('^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\\\$&*~]).{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'w9v4gkq2' /* Su contraseña debe contener 8 ... */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNameControllerValidator = _txtNameControllerValidator;
    txtEmailControllerValidator = _txtEmailControllerValidator;
    txtNumControllerValidator = _txtNumControllerValidator;
    txtPasswordVisibility = false;
    txtPasswordControllerValidator = _txtPasswordControllerValidator;
    txtConfirmVisibility = false;
    txtConfirmControllerValidator = _txtConfirmControllerValidator;
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
