import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_p_i_developer_portal_page_widget.dart'
    show APIDeveloperPortalPageWidget;
import 'package:flutter/material.dart';

class APIDeveloperPortalPageModel
    extends FlutterFlowModel<APIDeveloperPortalPageWidget> {
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
