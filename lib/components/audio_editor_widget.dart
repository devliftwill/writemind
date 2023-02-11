import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'audio_editor_model.dart';
export 'audio_editor_model.dart';

class AudioEditorWidget extends StatefulWidget {
  const AudioEditorWidget({
    Key? key,
    this.messageDoc,
    this.storyDoc,
  }) : super(key: key);

  final MessagesRecord? messageDoc;
  final StoriesRecord? storyDoc;

  @override
  _AudioEditorWidgetState createState() => _AudioEditorWidgetState();
}

class _AudioEditorWidgetState extends State<AudioEditorWidget> {
  late AudioEditorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioEditorModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowDropDown<String>(
                options: ['en-AU', 'en-IN', 'en-GB', 'en-US'],
                onChanged: (val) =>
                    setState(() => _model.dropDownCountryValue = val),
                width: double.infinity,
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                hintText: 'Select a Country',
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                hidesUnderline: true,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: FlutterFlowDropDown<String>(
                  options: ['FEMALE', 'MALE'],
                  onChanged: (val) =>
                      setState(() => _model.dropDownGenderValue = val),
                  width: double.infinity,
                  height: 50,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  hintText: 'Select a Gender',
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              StreamBuilder<List<BackgroundAudioRecord>>(
                stream: queryBackgroundAudioRecord(
                  queryBuilder: (backgroundAudioRecord) =>
                      backgroundAudioRecord.orderBy('name'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<BackgroundAudioRecord>
                      containerBackgroundAudioRecordList = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: FlutterFlowDropDown<String>(
                            options: containerBackgroundAudioRecordList
                                .map((e) => valueOrDefault<String>(
                                      e.name,
                                      'Name',
                                    ))
                                .toList()
                                .toList(),
                            onChanged: (val) => setState(
                                () => _model.dropDownBgMusicValue = val),
                            width: double.infinity,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            hintText: 'Select a Background Music',
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.dropDownCountryValue == null) {
                                return;
                              }
                              if (_model.dropDownGenderValue == null) {
                                return;
                              }

                              final storiesUpdateData = createStoriesRecordData(
                                backgroundAudioUrl:
                                    containerBackgroundAudioRecordList
                                        .where((e) =>
                                            e.name ==
                                            _model.dropDownBgMusicValue)
                                        .toList()
                                        .first
                                        .url,
                              );
                              await widget.storyDoc!.reference
                                  .update(storiesUpdateData);

                              final messagesUpdateData =
                                  createMessagesRecordData(
                                convertToAudio: true,
                                languageCode: _model.dropDownCountryValue,
                                ssmlGender: _model.dropDownGenderValue,
                              );
                              await widget.messageDoc!.reference
                                  .update(messagesUpdateData);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Your audio is being processed. This may take up to 30 seconds.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              );
                            },
                            text: 'Generate',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
