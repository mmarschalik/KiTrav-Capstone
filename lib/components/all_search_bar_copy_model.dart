import '/backend/api_requests/api_calls.dart';
import '/components/resultsection_hotel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_search_bar_copy_widget.dart' show AllSearchBarCopyWidget;
import 'package:flutter/material.dart';

class AllSearchBarCopyModel extends FlutterFlowModel<AllSearchBarCopyWidget> {
  ///  Local state fields for this component.

  List<dynamic> hotelResults = [];
  void addToHotelResults(dynamic item) => hotelResults.add(item);
  void removeFromHotelResults(dynamic item) => hotelResults.remove(item);
  void removeAtIndexFromHotelResults(int index) => hotelResults.removeAt(index);
  void insertAtIndexInHotelResults(int index, dynamic item) =>
      hotelResults.insert(index, item);
  void updateHotelResultsAtIndex(int index, Function(dynamic) updateFn) =>
      hotelResults[index] = updateFn(hotelResults[index]);

  String origin = 'origin';

  String destination = 'destination';

  String date = 'date';

  String departureid = 'departureid';

  String arrivalid = 'arrivalid';

  String outbounddate = 'outbounddate';

  int? adults;

  List<dynamic> flightsResults = [];
  void addToFlightsResults(dynamic item) => flightsResults.add(item);
  void removeFromFlightsResults(dynamic item) => flightsResults.remove(item);
  void removeAtIndexFromFlightsResults(int index) =>
      flightsResults.removeAt(index);
  void insertAtIndexInFlightsResults(int index, dynamic item) =>
      flightsResults.insert(index, item);
  void updateFlightsResultsAtIndex(int index, Function(dynamic) updateFn) =>
      flightsResults[index] = updateFn(flightsResults[index]);

  String? destinationHotel;

  String? checkInHotel;

  String? checkOutHotel;

  String? guestRoomHotel;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextFieldflightfrom widget.
  FocusNode? textFieldflightfromFocusNode;
  TextEditingController? textFieldflightfromTextController;
  String? Function(BuildContext, String?)?
      textFieldflightfromTextControllerValidator;
  // State field(s) for TextFieldflightto widget.
  FocusNode? textFieldflighttoFocusNode;
  TextEditingController? textFieldflighttoTextController;
  String? Function(BuildContext, String?)?
      textFieldflighttoTextControllerValidator;
  // State field(s) for TextFieldlightdepart widget.
  FocusNode? textFieldlightdepartFocusNode;
  TextEditingController? textFieldlightdepartTextController;
  String? Function(BuildContext, String?)?
      textFieldlightdepartTextControllerValidator;
  // State field(s) for TextFieldflightreturn widget.
  FocusNode? textFieldflightreturnFocusNode;
  TextEditingController? textFieldflightreturnTextController;
  String? Function(BuildContext, String?)?
      textFieldflightreturnTextControllerValidator;
  // State field(s) for TextFieldflightpassenger widget.
  FocusNode? textFieldflightpassengerFocusNode;
  TextEditingController? textFieldflightpassengerTextController;
  String? Function(BuildContext, String?)?
      textFieldflightpassengerTextControllerValidator;
  // Stores action output result for [Backend Call - API (SearchFlightsSerp)] action in Container widget.
  ApiCallResponse? apiResult4jm;
  // Stores action output result for [Backend Call - API (SearchFlightsSerp)] action in Button widget.
  ApiCallResponse? apiResultcmb;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // Stores action output result for [Backend Call - API (HotelSearchSerp)] action in Container widget.
  ApiCallResponse? apiResult819;
  // Stores action output result for [Backend Call - API (HotelSearchSerp)] action in Button widget.
  ApiCallResponse? apiResultmty;
  // Model for resultsectionHotel component.
  late ResultsectionHotelModel resultsectionHotelModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController18;
  String? Function(BuildContext, String?)? textController18Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode14;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode15;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode16;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode17;
  TextEditingController? textController22;
  String? Function(BuildContext, String?)? textController22Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode18;
  TextEditingController? textController23;
  String? Function(BuildContext, String?)? textController23Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode19;
  TextEditingController? textController24;
  String? Function(BuildContext, String?)? textController24Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode20;
  TextEditingController? textController25;
  String? Function(BuildContext, String?)? textController25Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode21;
  TextEditingController? textController26;
  String? Function(BuildContext, String?)? textController26Validator;

  @override
  void initState(BuildContext context) {
    resultsectionHotelModel =
        createModel(context, () => ResultsectionHotelModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldflightfromFocusNode?.dispose();
    textFieldflightfromTextController?.dispose();

    textFieldflighttoFocusNode?.dispose();
    textFieldflighttoTextController?.dispose();

    textFieldlightdepartFocusNode?.dispose();
    textFieldlightdepartTextController?.dispose();

    textFieldflightreturnFocusNode?.dispose();
    textFieldflightreturnTextController?.dispose();

    textFieldflightpassengerFocusNode?.dispose();
    textFieldflightpassengerTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController6?.dispose();

    textFieldFocusNode2?.dispose();
    textController7?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();

    textFieldFocusNode4?.dispose();
    textController9?.dispose();

    resultsectionHotelModel.dispose();
    textFieldFocusNode5?.dispose();
    textController10?.dispose();

    textFieldFocusNode6?.dispose();
    textController11?.dispose();

    textFieldFocusNode7?.dispose();
    textController12?.dispose();

    textFieldFocusNode8?.dispose();
    textController13?.dispose();

    textFieldFocusNode9?.dispose();
    textController14?.dispose();

    textFieldFocusNode10?.dispose();
    textController15?.dispose();

    textFieldFocusNode11?.dispose();
    textController16?.dispose();

    textFieldFocusNode12?.dispose();
    textController17?.dispose();

    textFieldFocusNode13?.dispose();
    textController18?.dispose();

    textFieldFocusNode14?.dispose();
    textController19?.dispose();

    textFieldFocusNode15?.dispose();
    textController20?.dispose();

    textFieldFocusNode16?.dispose();
    textController21?.dispose();

    textFieldFocusNode17?.dispose();
    textController22?.dispose();

    textFieldFocusNode18?.dispose();
    textController23?.dispose();

    textFieldFocusNode19?.dispose();
    textController24?.dispose();

    textFieldFocusNode20?.dispose();
    textController25?.dispose();

    textFieldFocusNode21?.dispose();
    textController26?.dispose();
  }
}
