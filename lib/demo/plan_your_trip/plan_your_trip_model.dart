import '/components/modals/search_modal/search_modal_widget.dart';
import '/components/search_suggestions_widget.dart';
import '/components/sidebar/sidebar_widget.dart';
import '/demo/demo_chat/demo_chat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_your_trip_widget.dart' show PlanYourTripWidget;
import 'package:flutter/material.dart';

class PlanYourTripModel extends FlutterFlowModel<PlanYourTripWidget> {
  ///  Local state fields for this page.

  bool? showSearchModal = false;

  bool showAttachments = false;

  bool showEmptyChat = true;

  bool showResponseLoading = false;

  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for DemoChat component.
  late DemoChatModel demoChatModel;
  // Model for searchSuggestions component.
  late SearchSuggestionsModel searchSuggestionsModel;
  // Model for SearchModal component.
  late SearchModalModel searchModalModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    demoChatModel = createModel(context, () => DemoChatModel());
    searchSuggestionsModel =
        createModel(context, () => SearchSuggestionsModel());
    searchModalModel = createModel(context, () => SearchModalModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    demoChatModel.dispose();
    searchSuggestionsModel.dispose();
    searchModalModel.dispose();
  }
}
