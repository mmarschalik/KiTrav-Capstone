import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pricing_plan_utility_page_widget.dart'
    show PricingPlanUtilityPageWidget;
import 'package:flutter/material.dart';

class PricingPlanUtilityPageModel
    extends FlutterFlowModel<PricingPlanUtilityPageWidget> {
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
