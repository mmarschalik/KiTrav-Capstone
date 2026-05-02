import '/components/all_search_bar_home_copy_widget.dart';
import '/components/destination_bundels_widget.dart';
import '/components/dropdown02_options_widget.dart';
import '/components/header_widget.dart';
import '/components/last_min_deals_widget.dart';
import '/components/popular_airlines_widget.dart';
import '/components/popular_destinations_widget.dart';
import '/components/search_suggestions_widget.dart';
import '/components/utils/base_input_field/base_input_field_widget.dart';
import '/components/warning_message_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'landing_page_widget.dart' show LandingPageWidget;
import 'package:flutter/material.dart';

class LandingPageModel extends FlutterFlowModel<LandingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Dropdown02Options component.
  late Dropdown02OptionsModel dropdown02OptionsModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PopularAirlines component.
  late PopularAirlinesModel popularAirlinesModel;
  // Model for BaseInputField component.
  late BaseInputFieldModel baseInputFieldModel;
  // Model for WarningMessage component.
  late WarningMessageModel warningMessageModel;
  // Model for searchSuggestions component.
  late SearchSuggestionsModel searchSuggestionsModel;
  // Model for AllSearchBarHomeCopy component.
  late AllSearchBarHomeCopyModel allSearchBarHomeCopyModel;
  // Model for DestinationBundels component.
  late DestinationBundelsModel destinationBundelsModel;
  // Model for LastMinDeals component.
  late LastMinDealsModel lastMinDealsModel;
  // Model for PopularDestinations component.
  late PopularDestinationsModel popularDestinationsModel;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;

  @override
  void initState(BuildContext context) {
    dropdown02OptionsModel =
        createModel(context, () => Dropdown02OptionsModel());
    headerModel = createModel(context, () => HeaderModel());
    popularAirlinesModel = createModel(context, () => PopularAirlinesModel());
    baseInputFieldModel = createModel(context, () => BaseInputFieldModel());
    warningMessageModel = createModel(context, () => WarningMessageModel());
    searchSuggestionsModel =
        createModel(context, () => SearchSuggestionsModel());
    allSearchBarHomeCopyModel =
        createModel(context, () => AllSearchBarHomeCopyModel());
    destinationBundelsModel =
        createModel(context, () => DestinationBundelsModel());
    lastMinDealsModel = createModel(context, () => LastMinDealsModel());
    popularDestinationsModel =
        createModel(context, () => PopularDestinationsModel());
    webFooterModel = createModel(context, () => WebFooterModel());
  }

  @override
  void dispose() {
    dropdown02OptionsModel.dispose();
    headerModel.dispose();
    popularAirlinesModel.dispose();
    baseInputFieldModel.dispose();
    warningMessageModel.dispose();
    searchSuggestionsModel.dispose();
    allSearchBarHomeCopyModel.dispose();
    destinationBundelsModel.dispose();
    lastMinDealsModel.dispose();
    popularDestinationsModel.dispose();
    webFooterModel.dispose();
  }
}
