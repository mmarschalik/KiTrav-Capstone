import '/components/chat/chat_bubble/chat_bubble_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chat_request_model.dart';
export 'chat_request_model.dart';

class ChatRequestWidget extends StatefulWidget {
  const ChatRequestWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<ChatRequestWidget> createState() => _ChatRequestWidgetState();
}

class _ChatRequestWidgetState extends State<ChatRequestWidget> {
  late ChatRequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatRequestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.chatBubbleModel,
          updateCallback: () => safeSetState(() {}),
          child: ChatBubbleWidget(
            text: widget.text,
          ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
