import '/components/all_search_bar_copy_widget.dart';
import '/components/header_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'final_search_page_widget.dart' show FinalSearchPageWidget;
import 'package:flutter/material.dart';

class FinalSearchPageModel extends FlutterFlowModel<FinalSearchPageWidget> {
  ///  Local state fields for this page.

  String? destination = '';

  String? checkIn = '';

  String? checkOut = '';

  String? guestRooms = '';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for AllSearchBarCopy component.
  late AllSearchBarCopyModel allSearchBarCopyModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    allSearchBarCopyModel = createModel(context, () => AllSearchBarCopyModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    allSearchBarCopyModel.dispose();
    webFooterModel.dispose();
  }
}
