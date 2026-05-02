import '/components/booking_confirmation_reference_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'booking_confirmation_page_model.dart';
export 'booking_confirmation_page_model.dart';

class BookingConfirmationPageWidget extends StatefulWidget {
  const BookingConfirmationPageWidget({super.key});

  static String routeName = 'BookingConfirmationPage';
  static String routePath = '/bookingConfirmationPage';

  @override
  State<BookingConfirmationPageWidget> createState() =>
      _BookingConfirmationPageWidgetState();
}

class _BookingConfirmationPageWidgetState
    extends State<BookingConfirmationPageWidget> {
  late BookingConfirmationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingConfirmationPageModel());

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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1440.0,
                      height: 1700.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.bookingConfirmationReferenceModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BookingConfirmationReferenceWidget(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 1440.0,
                      height: 654.9,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
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
