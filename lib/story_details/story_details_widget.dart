import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/chat_widget.dart';
import '../components/empty_widget.dart';
import '../components/image_actions_widget.dart';
import '../components/image_editor_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class StoryDetailsWidget extends StatefulWidget {
  const StoryDetailsWidget({
    Key? key,
    this.storyDoc,
  }) : super(key: key);

  final StoriesRecord? storyDoc;

  @override
  _StoryDetailsWidgetState createState() => _StoryDetailsWidgetState();
}

class _StoryDetailsWidgetState extends State<StoryDetailsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.storyDoc!.cover != null && widget.storyDoc!.cover != '') {
        FFAppState().update(() {
          FFAppState().selectedImage = widget.storyDoc!.cover!;
        });
      }
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.93,
                  child: ChatWidget(
                    storyRef: widget.storyDoc!.reference,
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.chat_bubble_outline_rounded,
          color: FlutterFlowTheme.of(context).secondaryColor,
          size: 24,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: StreamBuilder<StoriesRecord>(
          stream: StoriesRecord.getDocument(widget.storyDoc!.reference),
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
            final containerStoriesRecord = snapshot.data!;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Stack(
                        alignment: AlignmentDirectional(0, -1),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Image.network(
                              FFAppState().selectedImage,
                              width: double.infinity,
                              height: 500,
                              fit: BoxFit.cover,
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 44, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    icon: Icon(
                                      Icons.keyboard_backspace,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                    },
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.ios_share,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        await Share.share(
                                          '',
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0x801D2429),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (widget.storyDoc!.audio != null &&
                                            widget.storyDoc!.audio != '')
                                          Container(
                                            width: double.infinity,
                                            height: 120,
                                            child: custom_widgets
                                                .AudioPayerExtended(
                                              width: double.infinity,
                                              height: 120,
                                              audio: widget.storyDoc!.audio!,
                                              onDurationChanged: () async {},
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: textController ??=
                                  TextEditingController(
                                text: containerStoriesRecord.title,
                              ),
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 2000),
                                () async {
                                  final storiesUpdateData =
                                      createStoriesRecordData(
                                    title: textController?.text ?? '',
                                  );
                                  await widget.storyDoc!.reference
                                      .update(storiesUpdateData);
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter a title',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
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
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 5, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: ImageEditorWidget(
                                          storyRef: widget.storyDoc!.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'Add',
                                icon: Icon(
                                  Icons.image_outlined,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Container(
                              width: 100,
                              height: 400,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x301D2429),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: StreamBuilder<List<ImagesRecord>>(
                                  stream: queryImagesRecord(
                                    parent: widget.storyDoc!.reference,
                                    queryBuilder: (imagesRecord) =>
                                        imagesRecord.orderBy('created_date'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ImagesRecord>
                                        gridViewImagesRecordList =
                                        snapshot.data!;
                                    if (gridViewImagesRecordList.isEmpty) {
                                      return EmptyWidget(
                                        icon: Icon(
                                          Icons.image_not_supported,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          size: 50,
                                        ),
                                        header:
                                            'Looks like you don\'t have any images yet.',
                                        body:
                                            'Lorem ipsum dolor sit amet, consetetur  sadipscing elitr, sed diam nonumy eirmod.',
                                      );
                                    }
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewImagesRecordList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewImagesRecord =
                                            gridViewImagesRecordList[
                                                gridViewIndex];
                                        return Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 5),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      gridViewImagesRecord
                                                          .imageUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/writemind-en8c1n/assets/3rhb3i0igf0s/103891-simple-lazy-load.gif',
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .selectedImage =
                                                          gridViewImagesRecord
                                                              .imageUrl!;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                          Color(0x00FFFFFF),
                                                          Color(0x00B73A3A)
                                                        ],
                                                        stops: [0, 1, 1],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0, -1),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 30,
                                                      icon: Icon(
                                                        Icons.more_vert,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 15,
                                                      ),
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  ImageActionsWidget(
                                                                storyRef: widget
                                                                    .storyDoc!
                                                                    .reference,
                                                                imageDoc:
                                                                    gridViewImagesRecord,
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
