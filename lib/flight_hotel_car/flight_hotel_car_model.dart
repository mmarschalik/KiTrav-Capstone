import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'flight_hotel_car_widget.dart' show FlightHotelCarWidget;
import 'package:flutter/material.dart';

class FlightHotelCarModel extends FlutterFlowModel<FlightHotelCarWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    webFooterModel.dispose();
  }
}
