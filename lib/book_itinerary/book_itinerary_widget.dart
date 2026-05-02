import '/components/header_widget.dart';
import '/components/itinerary_booking_breakdown_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'book_itinerary_model.dart';
export 'book_itinerary_model.dart';

class BookItineraryWidget extends StatefulWidget {
  const BookItineraryWidget({super.key});

  static String routeName = 'BookItinerary';
  static String routePath = '/bookItinerary';

  @override
  State<BookItineraryWidget> createState() => _BookItineraryWidgetState();
}

class _BookItineraryWidgetState extends State<BookItineraryWidget> {
  late BookItineraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookItineraryModel());

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
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          onMenuTap: () async {},
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1440.0,
                      height: 788.71,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.itineraryBookingBreakdownModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ItineraryBookingBreakdownWidget(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1440.0,
                      height: 662.03,
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
