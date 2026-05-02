import '/components/header_widget.dart';
import '/components/settings_menu_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'settings_menu_page_model.dart';
export 'settings_menu_page_model.dart';

class SettingsMenuPageWidget extends StatefulWidget {
  const SettingsMenuPageWidget({super.key});

  static String routeName = 'SettingsMenuPage';
  static String routePath = '/settingsMenuPage';

  @override
  State<SettingsMenuPageWidget> createState() => _SettingsMenuPageWidgetState();
}

class _SettingsMenuPageWidgetState extends State<SettingsMenuPageWidget> {
  late SettingsMenuPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsMenuPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1441.1,
                      height: 257.96,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          onMenuTap: () async {},
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(300.0, 0.0, 300.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 878.79,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.settingsMenuModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SettingsMenuWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.webFooterModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WebFooterWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
