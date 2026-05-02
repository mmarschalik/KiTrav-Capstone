import '/components/billing_details_menu_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'billing_details_menu_page_widget.dart'
    show BillingDetailsMenuPageWidget;
import 'package:flutter/material.dart';

class BillingDetailsMenuPageModel
    extends FlutterFlowModel<BillingDetailsMenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for BillingDetailsMenu component.
  late BillingDetailsMenuModel billingDetailsMenuModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    billingDetailsMenuModel =
        createModel(context, () => BillingDetailsMenuModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    billingDetailsMenuModel.dispose();
    webFooterModel.dispose();
  }
}
