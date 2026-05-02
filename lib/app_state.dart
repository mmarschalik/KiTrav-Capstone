import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Use this for debuggin as a AppState
  String _debugGlobal = 'debuggin';
  String get debugGlobal => _debugGlobal;
  set debugGlobal(String value) {
    _debugGlobal = value;
  }
}
