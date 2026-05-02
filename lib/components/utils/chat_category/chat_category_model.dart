import '/components/utils/chat_item/chat_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_category_widget.dart' show ChatCategoryWidget;
import 'package:flutter/material.dart';

class ChatCategoryModel extends FlutterFlowModel<ChatCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ChatItem component.
  late ChatItemModel chatItemModel1;
  // Model for ChatItem component.
  late ChatItemModel chatItemModel2;
  // Model for ChatItem component.
  late ChatItemModel chatItemModel3;

  @override
  void initState(BuildContext context) {
    chatItemModel1 = createModel(context, () => ChatItemModel());
    chatItemModel2 = createModel(context, () => ChatItemModel());
    chatItemModel3 = createModel(context, () => ChatItemModel());
  }

  @override
  void dispose() {
    chatItemModel1.dispose();
    chatItemModel2.dispose();
    chatItemModel3.dispose();
  }
}
