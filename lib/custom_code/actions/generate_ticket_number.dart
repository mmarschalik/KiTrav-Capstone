// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String generateTicketNumber(String bookingType) {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final prefix = bookingType == 'flight' ? 'TKT' : 'HTLVCH';
  return '$prefix$timestamp';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
