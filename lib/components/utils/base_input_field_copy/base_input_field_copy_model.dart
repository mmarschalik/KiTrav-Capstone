import '/flutter_flow/flutter_flow_util.dart';
import 'base_input_field_copy_widget.dart' show BaseInputFieldCopyWidget;
import 'package:flutter/material.dart';

class BaseInputFieldCopyModel
    extends FlutterFlowModel<BaseInputFieldCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
