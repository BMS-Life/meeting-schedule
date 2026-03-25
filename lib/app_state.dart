import 'package:flutter/material.dart';
import "package:u_i_library_3c2hbt/backend/schema/structs/index.dart"
    as u_i_library_3c2hbt_data_schema;
import "package:u_i_library_3c2hbt/backend/schema/enums/enums.dart"
    as u_i_library_3c2hbt_enums;
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  bool _isAllowanceConfirm = false;
  bool get isAllowanceConfirm => _isAllowanceConfirm;
  set isAllowanceConfirm(bool value) {
    _isAllowanceConfirm = value;
  }

  bool _SelectEmploy2 = false;
  bool get SelectEmploy2 => _SelectEmploy2;
  set SelectEmploy2(bool value) {
    _SelectEmploy2 = value;
  }

  bool _SelectEmploy = false;
  bool get SelectEmploy => _SelectEmploy;
  set SelectEmploy(bool value) {
    _SelectEmploy = value;
  }

  bool _SelectEmploy3 = false;
  bool get SelectEmploy3 => _SelectEmploy3;
  set SelectEmploy3(bool value) {
    _SelectEmploy3 = value;
  }
}
