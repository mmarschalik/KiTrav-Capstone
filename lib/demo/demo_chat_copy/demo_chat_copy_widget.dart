import '/components/chat/chat_request/chat_request_widget.dart';
import '/components/chat/chat_response_a_i/chat_response_a_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'demo_chat_copy_model.dart';
export 'demo_chat_copy_model.dart';

class DemoChatCopyWidget extends StatefulWidget {
  const DemoChatCopyWidget({
    super.key,
    bool? isFetchingResponse,
  }) : this.isFetchingResponse = isFetchingResponse ?? false;

  final bool isFetchingResponse;

  @override
  State<DemoChatCopyWidget> createState() => _DemoChatCopyWidgetState();
}

class _DemoChatCopyWidgetState extends State<DemoChatCopyWidget> {
  late DemoChatCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoChatCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.scrollableWrapperScrollController?.animateTo(
        _model.scrollableWrapperScrollController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        controller: _model.scrollableWrapperScrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.chatRequestModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ChatRequestWidget(
                      text:
                          'I live in Phoenix I want to spend the upcoming weekend in Las Vegas with my friend and go party but also see special historic landmarks, we want to fly and stay at a 4 star casino. ',
                    ),
                  ),
                  wrapWithModel(
                    model: _model.chatResponseAIModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ChatResponseAIWidget(
                      content:
                          'I’m doing great! Thanks for sharing your dog’s picture! I’ll edit the image now and add a crown to your dog’s head. Give me a moment...',
                      isResponding: widget.isFetchingResponse,
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 24.0))
                    .addToStart(SizedBox(height: 12.0))
                    .addToEnd(SizedBox(height: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
