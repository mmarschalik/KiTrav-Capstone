import '/components/checkbox_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for checkbox component.
  late CheckboxModel checkboxModel1;
  // Model for checkbox component.
  late CheckboxModel checkboxModel2;
  // Model for checkbox component.
  late CheckboxModel checkboxModel3;
  // Model for checkbox component.
  late CheckboxModel checkboxModel4;
  // Model for checkbox component.
  late CheckboxModel checkboxModel5;
  // Model for checkbox component.
  late CheckboxModel checkboxModel6;

  @override
  void initState(BuildContext context) {
    checkboxModel1 = createModel(context, () => CheckboxModel());
    checkboxModel2 = createModel(context, () => CheckboxModel());
    checkboxModel3 = createModel(context, () => CheckboxModel());
    checkboxModel4 = createModel(context, () => CheckboxModel());
    checkboxModel5 = createModel(context, () => CheckboxModel());
    checkboxModel6 = createModel(context, () => CheckboxModel());
  }

  @override
  void dispose() {
    checkboxModel1.dispose();
    checkboxModel2.dispose();
    checkboxModel3.dispose();
    checkboxModel4.dispose();
    checkboxModel5.dispose();
    checkboxModel6.dispose();
  }
}
