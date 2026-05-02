import '/components/utils/chat_category/chat_category_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sidebar_model.dart';
export 'sidebar_model.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({
    super.key,
    this.onNewChat,
    this.onItemSelect,
    this.onSearch,
  });

  final Future Function()? onNewChat;
  final Future Function()? onItemSelect;
  final Future Function()? onSearch;

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  late SidebarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SidebarModel());

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
      width: _model.isExtended ? 260.0 : 80.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.menu,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                if (_model.isExtended)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.search,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      await widget.onSearch?.call();
                    },
                  ),
              ],
            ),
            if (!_model.isExtended)
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).info,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    await widget.onNewChat?.call();
                  },
                ),
              ),
            if (_model.isExtended)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.onNewChat?.call();
                        },
                        text: FFLocalizations.of(context).getText(
                          '8t48067a' /* New Trip */,
                        ),
                        icon: Icon(
                          Icons.add,
                          size: 16.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.transparent,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.chatCategoryModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ChatCategoryWidget(
                                categoryLabel: 'My Trips',
                                onItemSelect: () async {
                                  await widget.onItemSelect?.call();
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
          ].divide(SizedBox(height: _model.isExtended ? 12.0 : 48.0)),
        ),
      ),
    );
  }
}
