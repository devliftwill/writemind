import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'playground_model.dart';
export 'playground_model.dart';

class PlaygroundWidget extends StatefulWidget {
  const PlaygroundWidget({Key? key}) : super(key: key);

  @override
  _PlaygroundWidgetState createState() => _PlaygroundWidgetState();
}

class _PlaygroundWidgetState extends State<PlaygroundWidget> {
  late PlaygroundModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaygroundModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 24,
                  ),
                  Expanded(
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      inactiveColor: Color(0xFF9E9E9E),
                      min: 0,
                      max: 10,
                      value: _model.sliderValue ??= 0,
                      onChanged: (newValue) {
                        newValue = double.parse(newValue.toStringAsFixed(6));
                        setState(() => _model.sliderValue = newValue);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Text(
                      '0:00',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
