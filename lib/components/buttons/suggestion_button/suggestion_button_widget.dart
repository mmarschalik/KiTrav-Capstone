import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'suggestion_button_model.dart';
export 'suggestion_button_model.dart';

class SuggestionButtonWidget extends StatefulWidget {
  const SuggestionButtonWidget({
    super.key,
    String? label,
    required this.icon,
    this.onClick,
  }) : this.label = label ?? 'Hello world';

  final String label;
  final Widget? icon;
  final Future Function()? onClick;

  @override
  State<SuggestionButtonWidget> createState() => _SuggestionButtonWidgetState();
}

class _SuggestionButtonWidgetState extends State<SuggestionButtonWidget> {
  late SuggestionButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuggestionButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          _model.isHovered = false;
          safeSetState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          constraints: BoxConstraints(
            maxWidth: 240.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF048BE0),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent4,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    widget.icon!,
                    Text(
                      widget.label,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).info,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Icon(
                  Icons.chevron_right,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        _model.isHovered = true;
        safeSetState(() {});
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        _model.isHovered = false;
        safeSetState(() {});
      }),
    );
  }
}
