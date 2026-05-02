import '/components/billing_details_menu_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'billing_details_menu_page_model.dart';
export 'billing_details_menu_page_model.dart';

class BillingDetailsMenuPageWidget extends StatefulWidget {
  const BillingDetailsMenuPageWidget({super.key});

  static String routeName = 'BillingDetailsMenuPage';
  static String routePath = '/billingDetailsMenuPage';

  @override
  State<BillingDetailsMenuPageWidget> createState() =>
      _BillingDetailsMenuPageWidgetState();
}

class _BillingDetailsMenuPageWidgetState
    extends State<BillingDetailsMenuPageWidget> {
  late BillingDetailsMenuPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BillingDetailsMenuPageModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1442.82,
                      height: 255.6,
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
                Container(
                  width: double.infinity,
                  height: 679.29,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            300.0, 0.0, 300.0, 0.0),
                        child: wrapWithModel(
                          model: _model.billingDetailsMenuModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BillingDetailsMenuWidget(),
                        ),
                      ),
                    ],
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
