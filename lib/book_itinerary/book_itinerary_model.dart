import '/components/header_widget.dart';
import '/components/itinerary_booking_breakdown_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_itinerary_widget.dart' show BookItineraryWidget;
import 'package:flutter/material.dart';

class BookItineraryModel extends FlutterFlowModel<BookItineraryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ItineraryBookingBreakdown component.
  late ItineraryBookingBreakdownModel itineraryBookingBreakdownModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    itineraryBookingBreakdownModel =
        createModel(context, () => ItineraryBookingBreakdownModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    itineraryBookingBreakdownModel.dispose();
    webFooterModel.dispose();
  }
}
