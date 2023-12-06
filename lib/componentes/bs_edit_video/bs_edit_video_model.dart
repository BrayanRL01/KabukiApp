import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bs_edit_video_widget.dart' show BsEditVideoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BsEditVideoModel extends FlutterFlowModel<BsEditVideoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  String? _txtNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pq2enlxz' /* El nombre del video es requeri... */,
      );
    }

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
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
        'njbhrbx3' /* La descripción del video es re... */,
      );
    }

    if (val.length > 150) {
      return 'Maximum 150 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ddCategories widget.
  String? ddCategoriesValue;
  FormFieldController<String>? ddCategoriesValueController;
  // State field(s) for ddSkin widget.
  String? ddSkinValue;
  FormFieldController<String>? ddSkinValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNameControllerValidator = _txtNameControllerValidator;
    txtInfoControllerValidator = _txtInfoControllerValidator;
  }

  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameController?.dispose();

    txtInfoFocusNode?.dispose();
    txtInfoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
