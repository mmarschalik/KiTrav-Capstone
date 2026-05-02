import '/components/coming_soon_widget.dart';
import '/components/header_widget.dart';
import '/components/sidebar/sidebar_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'e_book_generator_model.dart';
export 'e_book_generator_model.dart';

class EBookGeneratorWidget extends StatefulWidget {
  const EBookGeneratorWidget({super.key});

  static String routeName = 'eBookGenerator';
  static String routePath = '/eBookGenerator';

  @override
  State<EBookGeneratorWidget> createState() => _EBookGeneratorWidgetState();
}

class _EBookGeneratorWidgetState extends State<EBookGeneratorWidget> {
  late EBookGeneratorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EBookGeneratorModel());

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
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: WebViewAware(
            child: wrapWithModel(
              model: _model.sidebarModel,
              updateCallback: () => safeSetState(() {}),
              child: SidebarWidget(
                onNewChat: () async {},
                onItemSelect: () async {},
                onSearch: () async {},
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 2000.0,
                        height: 239.0,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.comingSoonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ComingSoonWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 2000.0,
                      height: 666.1,
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.webFooterModel,
                        updateCallback: () => safeSetState(() {}),
                        child: WebFooterWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
