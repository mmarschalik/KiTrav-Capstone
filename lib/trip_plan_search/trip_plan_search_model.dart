import '/components/header_widget.dart';
import '/components/trip_planner_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trip_plan_search_widget.dart' show TripPlanSearchWidget;
import 'package:flutter/material.dart';

class TripPlanSearchModel extends FlutterFlowModel<TripPlanSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for TripPlanner component.
  late TripPlannerModel tripPlannerModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    tripPlannerModel = createModel(context, () => TripPlannerModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tripPlannerModel.dispose();
    webFooterModel.dispose();
  }
}
