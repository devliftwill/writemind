import '../backend/backend.dart';
import '../components/story_actions_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    Key? key,
    this.story,
  }) : super(key: key);

  final StoriesRecord? story;

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/lucidly_cash_money_3d_cartoon_b49e92bc-1696-4c9b-b6d0-0afb2d8e5d69.png',
          ).image,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Color(0x4B1A1F24),
            offset: Offset(0, 2),
          )
        ],
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).tertiaryColor,
            FlutterFlowTheme.of(context).primaryColor
          ],
          stops: [0, 1],
          begin: AlignmentDirectional(0.94, -1),
          end: AlignmentDirectional(-0.94, 1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x00266ED7),
              FlutterFlowTheme.of(context).secondaryBackground
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(1, 0),
            end: AlignmentDirectional(-1, 0),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.story!.title!,
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: StoryActionsWidget(
                                storyDoc: widget.story,
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      dateTimeFormat('relative', widget.story!.createdDate!),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
