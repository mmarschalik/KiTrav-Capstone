import '/components/coming_soon_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blog_utility_page_widget.dart' show BlogUtilityPageWidget;
import 'package:flutter/material.dart';

class BlogUtilityPageModel extends FlutterFlowModel<BlogUtilityPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ComingSoon component.
  late ComingSoonModel comingSoonModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    comingSoonModel = createModel(context, () => ComingSoonModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    comingSoonModel.dispose();
    webFooterModel.dispose();
  }
}
