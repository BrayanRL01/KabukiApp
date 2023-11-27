import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/bs_side_bar/bs_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'info_perfil_widget.dart' show InfoPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoPerfilModel extends FlutterFlowModel<InfoPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreController;
  String? Function(BuildContext, String?)? txtNombreControllerValidator;
  String? _txtNombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lukm8n9s' /* Su nombre es requerido. */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'vi5vjzku' /* El mínimo de caracteres es de ... */,
      );
    }
    if (val.length > 30) {
      return FFLocalizations.of(context).getText(
        'oupyiyxg' /* El máximo de caracteres es de ... */,
      );
    }

    return null;
  }

  // State field(s) for txtCorreo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoController;
  String? Function(BuildContext, String?)? txtCorreoControllerValidator;
  String? _txtCorreoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j3ac1rqr' /* Su correo electrónico es reque... */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 40) {
      return 'Maximum 40 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'd6zaaqwb' /* Debe ser un correo válido. */,
      );
    }
    return null;
  }

  // State field(s) for txNacimiento widget.
  FocusNode? txNacimientoFocusNode;
  TextEditingController? txNacimientoController;
  String? Function(BuildContext, String?)? txNacimientoControllerValidator;
  // State field(s) for txtTelefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoController;
  String? Function(BuildContext, String?)? txtTelefonoControllerValidator;
  String? _txtTelefonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p2ifnsj7' /* Su número telefónico es requer... */,
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

  // State field(s) for txtContrasena widget.
  FocusNode? txtContrasenaFocusNode;
  TextEditingController? txtContrasenaController;
  late bool txtContrasenaVisibility;
  String? Function(BuildContext, String?)? txtContrasenaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtCorreoControllerValidator = _txtCorreoControllerValidator;
    txtTelefonoControllerValidator = _txtTelefonoControllerValidator;
    txtContrasenaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txNacimientoFocusNode?.dispose();
    txNacimientoController?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoController?.dispose();

    txtContrasenaFocusNode?.dispose();
    txtContrasenaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
