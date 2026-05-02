import '/components/full_booking_summary_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booking_summary_page_widget.dart' show BookingSummaryPageWidget;
import 'package:flutter/material.dart';

class BookingSummaryPageModel
    extends FlutterFlowModel<BookingSummaryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for FullBookingSummary component.
  late FullBookingSummaryModel fullBookingSummaryModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    fullBookingSummaryModel =
        createModel(context, () => FullBookingSummaryModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    fullBookingSummaryModel.dispose();
    webFooterModel.dispose();
  }
}
