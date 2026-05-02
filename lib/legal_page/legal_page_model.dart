import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'legal_page_widget.dart' show LegalPageWidget;
import 'package:flutter/material.dart';

class LegalPageModel extends FlutterFlowModel<LegalPageWidget> {
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
