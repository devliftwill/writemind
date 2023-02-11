import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/message_actions_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ChatModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChatTextField widget.
  TextEditingController? chatTextFieldController;
  String? Function(BuildContext, String?)? chatTextFieldControllerValidator;
  String? _chatTextFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatTextFieldControllerValidator = _chatTextFieldControllerValidator;
  }

  void dispose() {
    chatTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
