import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'bs_create_product_widget.dart' show BsCreateProductWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsCreateProductModel extends FlutterFlowModel<BsCreateProductWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  String? _txtNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lxpksphe' /* El nombre del producto es requ... */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'udpl4pal' /* El nombre debe poseer un mínim... */,
      );
    }
    if (val.length > 30) {
      return FFLocalizations.of(context).getText(
        '8jzuqq1p' /* El nombre debe poseer un máxim... */,
      );
    }

    return null;
  }

  // State field(s) for txtPrecio widget.
  FocusNode? txtPrecioFocusNode;
  TextEditingController? txtPrecioController;
  String? Function(BuildContext, String?)? txtPrecioControllerValidator;
  String? _txtPrecioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k5ibwrux' /* El precio es requerido. */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'l3p6fum4' /* El precio debe serigual o mayo... */,
      );
    }
    if (val.length > 7) {
      return 'Maximum 7 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtInfo widget.
  FocusNode? txtInfoFocusNode;
  TextEditingController? txtInfoController;
  String? Function(BuildContext, String?)? txtInfoControllerValidator;
  String? _txtInfoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'si1oyj8g' /* La información del producto es... */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 150) {
      return FFLocalizations.of(context).getText(
        '5gahnt6h' /* La información del producto po... */,
      );
    }

    return null;
  }

  // State field(s) for ddCategories widget.
  String? ddCategoriesValue;
  FormFieldController<String>? ddCategoriesValueController;
  // State field(s) for ddBrands widget.
  String? ddBrandsValue;
  FormFieldController<String>? ddBrandsValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNameControllerValidator = _txtNameControllerValidator;
    txtPrecioControllerValidator = _txtPrecioControllerValidator;
    txtInfoControllerValidator = _txtInfoControllerValidator;
  }

  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtPrecioFocusNode?.dispose();
    txtPrecioController?.dispose();

    txtInfoFocusNode?.dispose();
    txtInfoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
