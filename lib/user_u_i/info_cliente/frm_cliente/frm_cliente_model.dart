import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/bs_side_bar/bs_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'frm_cliente_widget.dart' show FrmClienteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrmClienteModel extends FlutterFlowModel<FrmClienteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreController;
  String? Function(BuildContext, String?)? txtNombreControllerValidator;
  String? _txtNombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nn1o6gro' /* Su nombre es requerido. */,
      );
    }

    if (val.length > 40) {
      return FFLocalizations.of(context).getText(
        't0bustsw' /* Se permitren un máximo de 40 c... */,
      );
    }

    return null;
  }

  // State field(s) for txtEdad widget.
  FocusNode? txtEdadFocusNode;
  TextEditingController? txtEdadController;
  String? Function(BuildContext, String?)? txtEdadControllerValidator;
  String? _txtEdadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3n7wvs61' /* Su edad es requerida. */,
      );
    }

    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ddSkin widget.
  String? ddSkinValue;
  FormFieldController<String>? ddSkinValueController;
  // State field(s) for ddColor widget.
  String? ddColorValue;
  FormFieldController<String>? ddColorValueController;
  // State field(s) for ddAlergia widget.
  List<String>? ddAlergiaValue;
  FormFieldController<String>? ddAlergiaValueController;
  // State field(s) for ddProvincia widget.
  String? ddProvinciaValue;
  FormFieldController<String>? ddProvinciaValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtEdadControllerValidator = _txtEdadControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtEdadFocusNode?.dispose();
    txtEdadController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
