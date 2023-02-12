import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/story_status_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'story_editor_model.dart';
export 'story_editor_model.dart';

class StoryEditorWidget extends StatefulWidget {
  const StoryEditorWidget({Key? key}) : super(key: key);

  @override
  _StoryEditorWidgetState createState() => _StoryEditorWidgetState();
}

class _StoryEditorWidgetState extends State<StoryEditorWidget> {
  late StoryEditorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryEditorModel());

    _model.textController = TextEditingController();
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
      height: 540,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.textController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText:
                          '${currentUserDisplayName} the cat gets a new job at the local supermarket. ',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    maxLines: 8,
                    minLines: 8,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Narrator Gender',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData('Male'),
                  ChipData('Female'),
                  ChipData('Neutral')
                ],
                onChanged: (val) =>
                    setState(() => _model.choiceChipsValue1 = val?.first),
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  iconColor: Colors.white,
                  iconSize: 18,
                  elevation: 4,
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                  iconColor: Color(0x00000000),
                  iconSize: 18,
                  elevation: 4,
                ),
                chipSpacing: 10,
                multiselect: false,
                alignment: WrapAlignment.start,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Narrator Voice',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData('en-AU'),
                  ChipData('en-GB'),
                  ChipData('en-US')
                ],
                onChanged: (val) =>
                    setState(() => _model.choiceChipsValue2 = val?.first),
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  iconColor: Colors.white,
                  iconSize: 18,
                  elevation: 4,
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primaryText,
                  textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                  iconColor: Color(0x00000000),
                  iconSize: 18,
                  elevation: 4,
                ),
                chipSpacing: 10,
                multiselect: false,
                alignment: WrapAlignment.start,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }

                              final storiesCreateData = createStoriesRecordData(
                                userRef: currentUserReference,
                                title: 'My Story',
                                createdDate: getCurrentTimestamp,
                                status: 'Processing',
                                backgroundAudioUrl:
                                    containerBackgroundAudioRecordList
                                        .where((e) =>
                                            e.name ==
                                            _model.dropDownBgMusicValue)
                                        .toList()
                                        .first
                                        .url,
                                languageCode: _model.choiceChipsValue2,
                                ssmlGender: _model.choiceChipsValue1,
                                progress: 0.0,
                                text: _model.textController.text,
                              );
                              var storiesRecordReference =
                                  StoriesRecord.collection.doc();
                              await storiesRecordReference
                                  .set(storiesCreateData);
                              _model.storyDoc =
                                  StoriesRecord.getDocumentFromData(
                                      storiesCreateData,
                                      storiesRecordReference);
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: StoryStatusWidget(
                                      storyRef: _model.storyDoc!.reference,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              setState(() {});
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
