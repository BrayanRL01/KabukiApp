import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/bs_side_bar/bs_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'frm_cliente_widget.dart' show FrmClienteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrmClienteModel extends FlutterFlowModel<FrmClienteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreController;
  String? Function(BuildContext, String?)? txtNombreControllerValidator;
  // State field(s) for txtProvincia widget.
  FocusNode? txtProvinciaFocusNode;
  TextEditingController? txtProvinciaController;
  String? Function(BuildContext, String?)? txtProvinciaControllerValidator;
  // State field(s) for txtEdad widget.
  FocusNode? txtEdadFocusNode;
  TextEditingController? txtEdadController;
  String? Function(BuildContext, String?)? txtEdadControllerValidator;
  // State field(s) for txtPiel widget.
  FocusNode? txtPielFocusNode;
  TextEditingController? txtPielController;
  String? Function(BuildContext, String?)? txtPielControllerValidator;
  // State field(s) for txtAlergias widget.
  FocusNode? txtAlergiasFocusNode;
  TextEditingController? txtAlergiasController;
  String? Function(BuildContext, String?)? txtAlergiasControllerValidator;
  // State field(s) for txtColor widget.
  FocusNode? txtColorFocusNode;
  TextEditingController? txtColorController;
  String? Function(BuildContext, String?)? txtColorControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtProvinciaFocusNode?.dispose();
    txtProvinciaController?.dispose();

    txtEdadFocusNode?.dispose();
    txtEdadController?.dispose();

    txtPielFocusNode?.dispose();
    txtPielController?.dispose();

    txtAlergiasFocusNode?.dispose();
    txtAlergiasController?.dispose();

    txtColorFocusNode?.dispose();
    txtColorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
