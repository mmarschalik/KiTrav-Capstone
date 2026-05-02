import '/components/all_search_bar_home_copy_widget.dart';
import '/components/destination_bundels_widget.dart';
import '/components/header_mobile_widget.dart';
import '/components/header_widget.dart';
import '/components/last_min_deals_widget.dart';
import '/components/popular_airlines_widget.dart';
import '/components/popular_airlinesmobilr_widget.dart';
import '/components/popular_destinations_widget.dart';
import '/components/utils/base_input_field/base_input_field_widget.dart';
import '/components/warning_message_widget.dart';
import '/components/web_footer_mobile_widget.dart';
import '/components/web_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'landing_page2_widget.dart' show LandingPage2Widget;
import 'package:flutter/material.dart';

class LandingPage2Model extends FlutterFlowModel<LandingPage2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PopularAirlines component.
  late PopularAirlinesModel popularAirlinesModel;
  // Model for BaseInputField component.
  late BaseInputFieldModel baseInputFieldModel1;
  // Model for WarningMessage component.
  late WarningMessageModel warningMessageModel1;
  // Model for AllSearchBarHomeCopy component.
  late AllSearchBarHomeCopyModel allSearchBarHomeCopyModel1;
  // Model for DestinationBundels component.
  late DestinationBundelsModel destinationBundelsModel1;
  // Model for LastMinDeals component.
  late LastMinDealsModel lastMinDealsModel1;
  // Model for PopularDestinations component.
  late PopularDestinationsModel popularDestinationsModel1;
  // Model for WebFooter component.
  late WebFooterModel webFooterModel;
  // Model for HeaderMobile component.
  late HeaderMobileModel headerMobileModel;
  // Model for PopularAirlinesmobilr component.
  late PopularAirlinesmobilrModel popularAirlinesmobilrModel;
  // Model for BaseInputField component.
  late BaseInputFieldModel baseInputFieldModel2;
  // Model for WarningMessage component.
  late WarningMessageModel warningMessageModel2;
  // Model for AllSearchBarHomeCopy component.
  late AllSearchBarHomeCopyModel allSearchBarHomeCopyModel2;
  // Model for DestinationBundels component.
  late DestinationBundelsModel destinationBundelsModel2;
  // Model for LastMinDeals component.
  late LastMinDealsModel lastMinDealsModel2;
  // Model for PopularDestinations component.
  late PopularDestinationsModel popularDestinationsModel2;
  // Model for WebFooterMobile component.
  late WebFooterMobileModel webFooterMobileModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    popularAirlinesModel = createModel(context, () => PopularAirlinesModel());
    baseInputFieldModel1 = createModel(context, () => BaseInputFieldModel());
    warningMessageModel1 = createModel(context, () => WarningMessageModel());
    allSearchBarHomeCopyModel1 =
        createModel(context, () => AllSearchBarHomeCopyModel());
    destinationBundelsModel1 =
        createModel(context, () => DestinationBundelsModel());
    lastMinDealsModel1 = createModel(context, () => LastMinDealsModel());
    popularDestinationsModel1 =
        createModel(context, () => PopularDestinationsModel());
    webFooterModel = createModel(context, () => WebFooterModel());
    headerMobileModel = createModel(context, () => HeaderMobileModel());
    popularAirlinesmobilrModel =
        createModel(context, () => PopularAirlinesmobilrModel());
    baseInputFieldModel2 = createModel(context, () => BaseInputFieldModel());
    warningMessageModel2 = createModel(context, () => WarningMessageModel());
    allSearchBarHomeCopyModel2 =
        createModel(context, () => AllSearchBarHomeCopyModel());
    destinationBundelsModel2 =
        createModel(context, () => DestinationBundelsModel());
    lastMinDealsModel2 = createModel(context, () => LastMinDealsModel());
    popularDestinationsModel2 =
        createModel(context, () => PopularDestinationsModel());
    webFooterMobileModel = createModel(context, () => WebFooterMobileModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    popularAirlinesModel.dispose();
    baseInputFieldModel1.dispose();
    warningMessageModel1.dispose();
    allSearchBarHomeCopyModel1.dispose();
    destinationBundelsModel1.dispose();
    lastMinDealsModel1.dispose();
    popularDestinationsModel1.dispose();
    webFooterModel.dispose();
    headerMobileModel.dispose();
    popularAirlinesmobilrModel.dispose();
    baseInputFieldModel2.dispose();
    warningMessageModel2.dispose();
    allSearchBarHomeCopyModel2.dispose();
    destinationBundelsModel2.dispose();
    lastMinDealsModel2.dispose();
    popularDestinationsModel2.dispose();
    webFooterMobileModel.dispose();
  }
}
