import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ai_chat_page_widget.dart' show AiChatPageWidget;
import 'package:flutter/material.dart';

class AiChatPageModel extends FlutterFlowModel<AiChatPageWidget> {
  ///  Local state fields for this page.

  String? currentMessage = '';

  String? historyText;

  List<ChatMessageStruct> chatMessages = [];
  void addToChatMessages(ChatMessageStruct item) => chatMessages.add(item);
  void removeFromChatMessages(ChatMessageStruct item) =>
      chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, ChatMessageStruct item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(
          int index, Function(ChatMessageStruct) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for messageInput widget.
  FocusNode? messageInputFocusNode;
  TextEditingController? messageInputTextController;
  String? Function(BuildContext, String?)? messageInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (SendChatMessage)] action in IconButton widget.
  ApiCallResponse? apiResultesk;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageInputFocusNode?.dispose();
    messageInputTextController?.dispose();
  }
}
