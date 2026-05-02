import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'logo_button_model.dart';
export 'logo_button_model.dart';

class LogoButtonWidget extends StatefulWidget {
  const LogoButtonWidget({super.key});

  @override
  State<LogoButtonWidget> createState() => _LogoButtonWidgetState();
}

class _LogoButtonWidgetState extends State<LogoButtonWidget> {
  late LogoButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoButtonModel());

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
      width: 50.0,
      height: 50.0,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/images/logo_kitravia_Icon.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
