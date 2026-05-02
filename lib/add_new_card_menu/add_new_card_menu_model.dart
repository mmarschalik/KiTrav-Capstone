import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_new_card_menu_widget.dart' show AddNewCardMenuWidget;
import 'package:flutter/material.dart';

class AddNewCardMenuModel extends FlutterFlowModel<AddNewCardMenuWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
