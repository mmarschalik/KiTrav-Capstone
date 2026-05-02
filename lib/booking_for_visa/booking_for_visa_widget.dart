import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'booking_for_visa_model.dart';
export 'booking_for_visa_model.dart';

class BookingForVisaWidget extends StatefulWidget {
  const BookingForVisaWidget({super.key});

  static String routeName = 'Booking_For_Visa';
  static String routePath = '/bookingForVisa';

  @override
  State<BookingForVisaWidget> createState() => _BookingForVisaWidgetState();
}

class _BookingForVisaWidgetState extends State<BookingForVisaWidget> {
  late BookingForVisaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingForVisaModel());

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
                wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeaderWidget(
                    onMenuTap: () async {},
                  ),
                ),
                Container(
                  width: 2300.0,
                  height: 906.71,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowWebView(
                    content: 'https://kitravia-visa.netlify.app/',
                    bypass: false,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    verticalScroll: false,
                    horizontalScroll: false,
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.webFooterModel,
                    updateCallback: () => safeSetState(() {}),
                    child: WebFooterWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
