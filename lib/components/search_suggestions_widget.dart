import '/components/buttons/suggestion_button/suggestion_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_suggestions_model.dart';
export 'search_suggestions_model.dart';

class SearchSuggestionsWidget extends StatefulWidget {
  const SearchSuggestionsWidget({super.key});

  @override
  State<SearchSuggestionsWidget> createState() =>
      _SearchSuggestionsWidgetState();
}

class _SearchSuggestionsWidgetState extends State<SearchSuggestionsWidget> {
  late SearchSuggestionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchSuggestionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Container(
        width: 1020.4,
        height: 305.4,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.32, -0.95),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Cruise',
                    icon: Icon(
                      Icons.directions_boat_sharp,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.34, 0.58),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Vacation',
                    icon: Icon(
                      Icons.airplane_ticket_rounded,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.68, -0.18),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Holiday Packages',
                    icon: Icon(
                      Icons.forest_sharp,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.34, 0.58),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Hotel Deals',
                    icon: Icon(
                      Icons.home_work_outlined,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.95, -0.93),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Flight Booking',
                    icon: Icon(
                      Icons.flight_takeoff,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.32, -0.95),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Hotel',
                    icon: Icon(
                      Icons.hotel,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.67, -0.16),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Things to Do',
                    icon: Icon(
                      Icons.hiking,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -0.17),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel8,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Places to Go',
                    icon: Icon(
                      Icons.hail,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.96, -0.95),
                child: wrapWithModel(
                  model: _model.suggestionButtonModel9,
                  updateCallback: () => safeSetState(() {}),
                  child: SuggestionButtonWidget(
                    label: 'Car Rental',
                    icon: Icon(
                      Icons.directions_car,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onClick: () async {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
