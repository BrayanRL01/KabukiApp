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
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtPhone widget.
  FocusNode? txtPhoneFocusNode;
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  DateTime? datePicked;
  // State field(s) for txtContr widget.
  FocusNode? txtContrFocusNode;
  TextEditingController? txtContrController;
  late bool txtContrVisibility;
  String? Function(BuildContext, String?)? txtContrControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtContrVisibility = false;
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
