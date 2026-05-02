import '/components/header_widget.dart';
import '/components/trip_form_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trip_request_page_widget.dart' show TripRequestPageWidget;
import 'package:flutter/material.dart';

class TripRequestPageModel extends FlutterFlowModel<TripRequestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for TripForm component.
  late TripFormModel tripFormModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    tripFormModel = createModel(context, () => TripFormModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tripFormModel.dispose();
    webFooterModel.dispose();
  }
}
