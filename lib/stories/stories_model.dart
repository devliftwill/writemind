import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_widget.dart';
import '../components/story_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoriesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailTextField widget.
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in FloatingActionButton widget.
  StoriesRecord? story;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
