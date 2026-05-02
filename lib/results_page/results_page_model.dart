import '/components/header_widget.dart';
import '/components/results_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'results_page_widget.dart' show ResultsPageWidget;
import 'package:flutter/material.dart';

class ResultsPageModel extends FlutterFlowModel<ResultsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Results component.
  late ResultsModel resultsModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    resultsModel = createModel(context, () => ResultsModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    resultsModel.dispose();
  }
}
