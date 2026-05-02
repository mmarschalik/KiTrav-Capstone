import '/components/complete_booking_form_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booking_form_widget.dart' show BookingFormWidget;
import 'package:flutter/material.dart';

class BookingFormModel extends FlutterFlowModel<BookingFormWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for CompleteBookingForm component.
  late CompleteBookingFormModel completeBookingFormModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    completeBookingFormModel =
        createModel(context, () => CompleteBookingFormModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    completeBookingFormModel.dispose();
    webFooterModel.dispose();
  }
}
