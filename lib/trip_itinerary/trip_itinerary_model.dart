import '/components/trip_itinerary_output_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trip_itinerary_widget.dart' show TripItineraryWidget;
import 'package:flutter/material.dart';

class TripItineraryModel extends FlutterFlowModel<TripItineraryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TripItineraryOutput component.
  late TripItineraryOutputModel tripItineraryOutputModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    tripItineraryOutputModel =
        createModel(context, () => TripItineraryOutputModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    tripItineraryOutputModel.dispose();
    webFooterModel.dispose();
  }
}
