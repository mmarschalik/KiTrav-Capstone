import '/components/chat/chat_request/chat_request_widget.dart';
import '/components/chat/chat_response_a_i/chat_response_a_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'demo_chat_model.dart';
export 'demo_chat_model.dart';

class DemoChatWidget extends StatefulWidget {
  const DemoChatWidget({
    super.key,
    bool? isFetchingResponse,
  }) : this.isFetchingResponse = isFetchingResponse ?? false;

  final bool isFetchingResponse;

  @override
  State<DemoChatWidget> createState() => _DemoChatWidgetState();
}

class _DemoChatWidgetState extends State<DemoChatWidget> {
  late DemoChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoChatModel());

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
      width: 933.99,
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        controller: _model.scrollableWrapperScrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 100.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                    child: wrapWithModel(
                      model: _model.chatRequestModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ChatRequestWidget(
                        text:
                            'I live in Phoenix I want to spend the upcoming weekend in Las Vegas with my friend and go party but also see special historic landmarks, we want to fly and stay at a 4 star casino. ',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.chatResponseAIModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ChatResponseAIWidget(
                        content:
                            'Sounds like a nice weekend. Here are serveral flight and hotel options, as well as activities to select from for both night and day.',
                        isResponding: widget.isFetchingResponse,
                      ),
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
