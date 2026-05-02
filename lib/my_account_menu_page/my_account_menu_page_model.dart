import '/components/header_widget.dart';
import '/components/my_account_menu_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_account_menu_page_widget.dart' show MyAccountMenuPageWidget;
import 'package:flutter/material.dart';

class MyAccountMenuPageModel extends FlutterFlowModel<MyAccountMenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for MyAccountMenu component.
  late MyAccountMenuModel myAccountMenuModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    myAccountMenuModel = createModel(context, () => MyAccountMenuModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    myAccountMenuModel.dispose();
    webFooterModel.dispose();
  }
}
