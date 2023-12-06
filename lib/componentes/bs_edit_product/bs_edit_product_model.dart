import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bs_edit_product_widget.dart' show BsEditProductWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsEditProductModel extends FlutterFlowModel<BsEditProductWidget> {
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
  // State field(s) for txtStack widget.
  FocusNode? txtStackFocusNode;
  TextEditingController? txtStackController;
  String? Function(BuildContext, String?)? txtStackControllerValidator;
  // State field(s) for ddCategories widget.
  String? ddCategoriesValue;
  FormFieldController<String>? ddCategoriesValueController;
  // State field(s) for ddBrands widget.
  String? ddBrandsValue;
  FormFieldController<String>? ddBrandsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtPrecioFocusNode?.dispose();
    txtPrecioController?.dispose();

    txtInfoFocusNode?.dispose();
    txtInfoController?.dispose();

    txtStackFocusNode?.dispose();
    txtStackController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
