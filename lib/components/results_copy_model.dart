import '/components/events_widget.dart';
import '/components/landmarks_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'results_copy_widget.dart' show ResultsCopyWidget;
import 'package:flutter/material.dart';

class ResultsCopyModel extends FlutterFlowModel<ResultsCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Landmarks component.
  late LandmarksModel landmarksModel;
  // Model for Events component.
  late EventsModel eventsModel;

  @override
  void initState(BuildContext context) {
    landmarksModel = createModel(context, () => LandmarksModel());
    eventsModel = createModel(context, () => EventsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    landmarksModel.dispose();
    eventsModel.dispose();
  }
}
