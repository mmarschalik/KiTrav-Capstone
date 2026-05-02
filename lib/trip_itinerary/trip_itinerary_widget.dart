import '/components/trip_itinerary_output_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'trip_itinerary_model.dart';
export 'trip_itinerary_model.dart';

class TripItineraryWidget extends StatefulWidget {
  const TripItineraryWidget({super.key});

  static String routeName = 'TripItinerary';
  static String routePath = '/tripItinerary';

  @override
  State<TripItineraryWidget> createState() => _TripItineraryWidgetState();
}

class _TripItineraryWidgetState extends State<TripItineraryWidget> {
  late TripItineraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripItineraryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1440.0,
                      height: 1151.89,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.tripItineraryOutputModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TripItineraryOutputWidget(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1440.0,
                      height: 665.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.webFooterModel,
                        updateCallback: () => safeSetState(() {}),
                        child: WebFooterWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
