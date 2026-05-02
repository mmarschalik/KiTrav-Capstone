import '/components/all_search_bar_copy_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'final_search_page_model.dart';
export 'final_search_page_model.dart';

/// Create a modern responsive hotel search page for Kitravia that works as
/// both a website page and a web app page.
///
/// The page should include:
/// - a clean top navigation/header with the title "Find Hotels"
/// - a wide search section near the top
/// - destination input field
/// - check-in date picker
/// - check-out date picker
/// - guests and rooms selector
/// - a prominent search button
/// - a hotel results section below
///
/// Each hotel card should include:
/// - hotel image placeholder
/// - hotel name
/// - location
/// - star rating
/// - price per night
/// - short amenities row such as WiFi, breakfast, and pool
/// - a "View Details" button
///
/// Design requirements:
/// - modern, clean, premium travel platform look
/// - responsive layout for desktop, laptop, tablet, and mobile
/// - suitable for both website and web app use
/// - rounded corners
/// - soft shadows
/// - blue and white color theme
/// - neat spacing and clean alignment
/// - multiple hotel cards per row on larger screens
/// - cards stack properly on smaller screens
/// - simple and professional UI
class FinalSearchPageWidget extends StatefulWidget {
  const FinalSearchPageWidget({super.key});

  static String routeName = 'FinalSearchPage';
  static String routePath = '/finalSearchPage';

  @override
  State<FinalSearchPageWidget> createState() => _FinalSearchPageWidgetState();
}

class _FinalSearchPageWidgetState extends State<FinalSearchPageWidget> {
  late FinalSearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalSearchPageModel());

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
        backgroundColor: Color(0xFFF0F4F8),
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
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 2643.8,
                    constraints: BoxConstraints(
                      maxWidth: 1100.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 24.0,
                          color: Color(0x22000000),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: wrapWithModel(
                      model: _model.allSearchBarCopyModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AllSearchBarCopyWidget(),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 1100.0,
                      ),
                    ),
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
