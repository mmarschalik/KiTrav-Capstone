import '/components/header_widget.dart';
import '/components/settings_menu_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_menu_page_widget.dart' show SettingsMenuPageWidget;
import 'package:flutter/material.dart';

class SettingsMenuPageModel extends FlutterFlowModel<SettingsMenuPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SettingsMenu component.
  late SettingsMenuModel settingsMenuModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    settingsMenuModel = createModel(context, () => SettingsMenuModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    settingsMenuModel.dispose();
    webFooterModel.dispose();
  }
}
