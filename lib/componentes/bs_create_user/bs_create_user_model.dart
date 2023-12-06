import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'bs_create_user_widget.dart' show BsCreateUserWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsCreateUserModel extends FlutterFlowModel<BsCreateUserWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  String? _txtNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g4u18gpr' /* El nombre es requerido. */,
      );
    }

    if (val.length < 15) {
      return 'Requires at least 15 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
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
        'sl5cwfbe' /* El correo electrónico es reque... */,
      );
    }

    if (val.length > 40) {
      return 'Maximum 40 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0uktyngh' /* Debe ingresar un correo electr... */,
      );
    }
    return null;
  }

  // State field(s) for txtPhone widget.
  FocusNode? txtPhoneFocusNode;
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  String? _txtPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nb3bkxn5' /* El número telefónico es requer... */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 8) {
      return 'Maximum 8 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for txtContr widget.
  FocusNode? txtContrFocusNode;
  TextEditingController? txtContrController;
  late bool txtContrVisibility;
  String? Function(BuildContext, String?)? txtContrControllerValidator;
  String? _txtContrControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'akbj3ey7' /* La contraseña es requerida. */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\\\$&*~]).{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'pzgbg9sy' /* Su contraseña debe contener 8 ... */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNameControllerValidator = _txtNameControllerValidator;
    txtEmailControllerValidator = _txtEmailControllerValidator;
    txtPhoneControllerValidator = _txtPhoneControllerValidator;
    txtContrVisibility = false;
    txtContrControllerValidator = _txtContrControllerValidator;
  }

  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailController?.dispose();

    txtPhoneFocusNode?.dispose();
    txtPhoneController?.dispose();

    txtContrFocusNode?.dispose();
    txtContrController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
