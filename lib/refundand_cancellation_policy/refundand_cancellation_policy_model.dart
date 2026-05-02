import '/components/dropdown02_options_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'refundand_cancellation_policy_widget.dart'
    show RefundandCancellationPolicyWidget;
import 'package:flutter/material.dart';

class RefundandCancellationPolicyModel
    extends FlutterFlowModel<RefundandCancellationPolicyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;
  // Model for Dropdown02Options component.
  late Dropdown02OptionsModel dropdown02OptionsModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    webFooterModel = createModel(context, () => WebFooterModel());
    dropdown02OptionsModel =
        createModel(context, () => Dropdown02OptionsModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    webFooterModel.dispose();
    dropdown02OptionsModel.dispose();
  }
}
