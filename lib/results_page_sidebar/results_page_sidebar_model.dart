import '/components/header_widget.dart';
import '/components/results_copy_widget.dart';
import '/components/sidebar/sidebar_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'results_page_sidebar_widget.dart' show ResultsPageSidebarWidget;
import 'package:flutter/material.dart';

class ResultsPageSidebarModel
    extends FlutterFlowModel<ResultsPageSidebarWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ResultsCopy component.
  late ResultsCopyModel resultsCopyModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    headerModel = createModel(context, () => HeaderModel());
    resultsCopyModel = createModel(context, () => ResultsCopyModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    headerModel.dispose();
    resultsCopyModel.dispose();
    webFooterModel.dispose();
  }
}
