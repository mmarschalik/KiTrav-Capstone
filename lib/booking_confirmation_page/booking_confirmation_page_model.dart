import '/components/booking_confirmation_reference_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booking_confirmation_page_widget.dart'
    show BookingConfirmationPageWidget;
import 'package:flutter/material.dart';

class BookingConfirmationPageModel
    extends FlutterFlowModel<BookingConfirmationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for BookingConfirmationReference component.
  late BookingConfirmationReferenceModel bookingConfirmationReferenceModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    bookingConfirmationReferenceModel =
        createModel(context, () => BookingConfirmationReferenceModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    bookingConfirmationReferenceModel.dispose();
    webFooterModel.dispose();
  }
}
