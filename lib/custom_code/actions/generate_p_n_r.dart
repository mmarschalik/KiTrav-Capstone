// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

String generatePNR() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  final random = Random();
  String pnr = '';

  for (int i = 0; i < 6; i++) {
    pnr += chars[random.nextInt(chars.length)];
  }

  return pnr;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
