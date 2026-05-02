import '/components/dropdown02_options_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'account_options_widget.dart' show AccountOptionsWidget;
import 'package:flutter/material.dart';

class AccountOptionsModel extends FlutterFlowModel<AccountOptionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Dropdown02Options component.
  late Dropdown02OptionsModel dropdown02OptionsModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    dropdown02OptionsModel =
        createModel(context, () => Dropdown02OptionsModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    dropdown02OptionsModel.dispose();
    webFooterModel.dispose();
  }
}
