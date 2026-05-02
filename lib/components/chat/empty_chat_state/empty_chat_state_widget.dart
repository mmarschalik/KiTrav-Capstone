import '/components/home_query_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_chat_state_model.dart';
export 'empty_chat_state_model.dart';

class EmptyChatStateWidget extends StatefulWidget {
  const EmptyChatStateWidget({
    super.key,
    this.onItemPress,
  });

  final Future Function()? onItemPress;

  @override
  State<EmptyChatStateWidget> createState() => _EmptyChatStateWidgetState();
}

class _EmptyChatStateWidgetState extends State<EmptyChatStateWidget> {
  late EmptyChatStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatStateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.homeQueryModel,
      updateCallback: () => safeSetState(() {}),
      child: HomeQueryWidget(),
    );
  }
}
