import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/bs_side_bar/bs_side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'editar_cliente_widget.dart' show EditarClienteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarClienteModel extends FlutterFlowModel<EditarClienteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtCumple widget.
  FocusNode? txtCumpleFocusNode;
  TextEditingController? txtCumpleController;
  String? Function(BuildContext, String?)? txtCumpleControllerValidator;
  // State field(s) for txtNum widget.
  FocusNode? txtNumFocusNode;
  TextEditingController? txtNumController;
  String? Function(BuildContext, String?)? txtNumControllerValidator;
  // State field(s) for txtCorreo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoController;
  String? Function(BuildContext, String?)? txtCorreoControllerValidator;
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
    txtCumpleFocusNode?.dispose();
    txtCumpleController?.dispose();

    txtNumFocusNode?.dispose();
    txtNumController?.dispose();

    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txtAlergiasFocusNode?.dispose();
    txtAlergiasController?.dispose();

    txtColorFocusNode?.dispose();
    txtColorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
