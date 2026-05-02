import '/components/chat/chat_request/chat_request_widget.dart';
import '/components/chat/chat_response_a_i/chat_response_a_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'demo_chat_widget.dart' show DemoChatWidget;
import 'package:flutter/material.dart';

class DemoChatModel extends FlutterFlowModel<DemoChatWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ScrollableWrapper widget.
  ScrollController? scrollableWrapperScrollController;
  // Model for ChatRequest component.
  late ChatRequestModel chatRequestModel;
  // Model for ChatResponseAI component.
  late ChatResponseAIModel chatResponseAIModel;

  @override
  void initState(BuildContext context) {
    scrollableWrapperScrollController = ScrollController();
    chatRequestModel = createModel(context, () => ChatRequestModel());
    chatResponseAIModel = createModel(context, () => ChatResponseAIModel());
  }

  @override
  void dispose() {
    scrollableWrapperScrollController?.dispose();
    chatRequestModel.dispose();
    chatResponseAIModel.dispose();
  }
}
