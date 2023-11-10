import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'bs_create_product_widget.dart' show BsCreateProductWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsCreateProductModel extends FlutterFlowModel<BsCreateProductWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  // State field(s) for txtPrecio widget.
  FocusNode? txtPrecioFocusNode;
  TextEditingController? txtPrecioController;
  String? Function(BuildContext, String?)? txtPrecioControllerValidator;
  // State field(s) for txtInfo widget.
  FocusNode? txtInfoFocusNode;
  TextEditingController? txtInfoController;
  String? Function(BuildContext, String?)? txtInfoControllerValidator;
  // State field(s) for txtMarca widget.
  FocusNode? txtMarcaFocusNode;
  TextEditingController? txtMarcaController;
  String? Function(BuildContext, String?)? txtMarcaControllerValidator;
  // State field(s) for txtCategoria widget.
  FocusNode? txtCategoriaFocusNode;
  TextEditingController? txtCategoriaController;
  String? Function(BuildContext, String?)? txtCategoriaControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtPrecioFocusNode?.dispose();
    txtPrecioController?.dispose();

    txtInfoFocusNode?.dispose();
    txtInfoController?.dispose();

    txtMarcaFocusNode?.dispose();
    txtMarcaController?.dispose();

    txtCategoriaFocusNode?.dispose();
    txtCategoriaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
