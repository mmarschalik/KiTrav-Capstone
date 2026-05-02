import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'warning_message_model.dart';
export 'warning_message_model.dart';

class WarningMessageWidget extends StatefulWidget {
  const WarningMessageWidget({super.key});

  @override
  State<WarningMessageWidget> createState() => _WarningMessageWidgetState();
}

class _WarningMessageWidgetState extends State<WarningMessageWidget> {
  late WarningMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarningMessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      FFLocalizations.of(context).getText(
        'p8nrr290' /* Kitravia can make mistakes. Do... */,
      ),
      style: FlutterFlowTheme.of(context).bodySmall.override(
            font: GoogleFonts.interTight(
              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 16.0,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
          ),
    );
  }
}
