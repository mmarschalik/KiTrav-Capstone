import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'visa_platform_model.dart';
export 'visa_platform_model.dart';

class VisaPlatformWidget extends StatefulWidget {
  const VisaPlatformWidget({super.key});

  static String routeName = 'Visa_Platform';
  static String routePath = '/visaPlatform';

  @override
  State<VisaPlatformWidget> createState() => _VisaPlatformWidgetState();
}

class _VisaPlatformWidgetState extends State<VisaPlatformWidget> {
  late VisaPlatformModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisaPlatformModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => safeSetState(() {}),
                child: HeaderWidget(
                  onMenuTap: () async {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
