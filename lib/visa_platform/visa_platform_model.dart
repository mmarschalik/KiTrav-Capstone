import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visa_platform_widget.dart' show VisaPlatformWidget;
import 'package:flutter/material.dart';

class VisaPlatformModel extends FlutterFlowModel<VisaPlatformWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
