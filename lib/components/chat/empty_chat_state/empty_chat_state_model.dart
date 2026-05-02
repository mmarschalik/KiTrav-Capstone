import '/components/home_query_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'empty_chat_state_widget.dart' show EmptyChatStateWidget;
import 'package:flutter/material.dart';

class EmptyChatStateModel extends FlutterFlowModel<EmptyChatStateWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HomeQuery component.
  late HomeQueryModel homeQueryModel;

  @override
  void initState(BuildContext context) {
    homeQueryModel = createModel(context, () => HomeQueryModel());
  }

  @override
  void dispose() {
    homeQueryModel.dispose();
  }
}
