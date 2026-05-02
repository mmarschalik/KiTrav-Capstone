import '/flutter_flow/flutter_flow_util.dart';
import 'trip_planner_widget.dart' show TripPlannerWidget;
import 'package:flutter/material.dart';

class TripPlannerModel extends FlutterFlowModel<TripPlannerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
