import '/components/coming_soon_widget.dart';
import '/components/header_widget.dart';
import '/components/sidebar/sidebar_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'e_book_generator_widget.dart' show EBookGeneratorWidget;
import 'package:flutter/material.dart';

class EBookGeneratorModel extends FlutterFlowModel<EBookGeneratorWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ComingSoon component.
  late ComingSoonModel comingSoonModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    headerModel = createModel(context, () => HeaderModel());
    comingSoonModel = createModel(context, () => ComingSoonModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    headerModel.dispose();
    comingSoonModel.dispose();
    webFooterModel.dispose();
  }
}
