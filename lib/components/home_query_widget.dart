import '/components/buttons/suggestion_button/suggestion_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_query_model.dart';
export 'home_query_model.dart';

class HomeQueryWidget extends StatefulWidget {
  const HomeQueryWidget({super.key});

  @override
  State<HomeQueryWidget> createState() => _HomeQueryWidgetState();
}

class _HomeQueryWidgetState extends State<HomeQueryWidget> {
  late HomeQueryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeQueryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '4gkk3l5g' /* Hi, I'm KiTravia. I will be yo... */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 40.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                ),
          ),
        ),
        Container(
          width: 540.69,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'nt36a9oy' /* Not sure where to start? Tell ... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              itemCount: 4,
              itemBuilder: (context, index) {
                return [
                  () => Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.suggestionButtonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: SuggestionButtonWidget(
                            label: 'Trip for two, destination Barcelona',
                            icon: Icon(
                              Icons.airplane_ticket,
                              color: Color(0xFF1360AB),
                              size: 20.0,
                            ),
                            onClick: () async {},
                          ),
                        ),
                      ),
                  () => Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.suggestionButtonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: SuggestionButtonWidget(
                            label: 'Road trip, destination LA',
                            icon: Icon(
                              Icons.emoji_transportation,
                              color: Color(0xFF1360AB),
                              size: 20.0,
                            ),
                            onClick: () async {},
                          ),
                        ),
                      ),
                  () => Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.suggestionButtonModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: SuggestionButtonWidget(
                            label: 'Northern cruise for four',
                            icon: Icon(
                              Icons.directions_boat,
                              color: Color(0xFF1360AB),
                              size: 20.0,
                            ),
                            onClick: () async {},
                          ),
                        ),
                      ),
                  () => Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.suggestionButtonModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: SuggestionButtonWidget(
                            label: 'Family vacation of 4 to the alps',
                            icon: Icon(
                              Icons.hiking,
                              color: Color(0xFF1360AB),
                              size: 20.0,
                            ),
                            onClick: () async {},
                          ),
                        ),
                      ),
                ][index]();
              },
            ),
          ),
        ),
        Container(
          width: 620.0,
          constraints: BoxConstraints(
            maxHeight: 160.0,
          ),
          decoration: BoxDecoration(),
        ),
      ].divide(SizedBox(height: 24.0)),
    );
  }
}
