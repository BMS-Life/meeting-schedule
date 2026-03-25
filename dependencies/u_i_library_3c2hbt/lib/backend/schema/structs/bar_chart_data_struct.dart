// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarChartDataStruct extends BaseStruct {
  BarChartDataStruct({
    String? label,
    double? yValues1,
    double? yValues2,
    double? yValues3,
    double? yValues4,
    double? yValues5,
    double? yValues6,
    double? yValues7,
    double? yValues8,
    double? yValues9,
    double? yValues10,
  })  : _label = label,
        _yValues1 = yValues1,
        _yValues2 = yValues2,
        _yValues3 = yValues3,
        _yValues4 = yValues4,
        _yValues5 = yValues5,
        _yValues6 = yValues6,
        _yValues7 = yValues7,
        _yValues8 = yValues8,
        _yValues9 = yValues9,
        _yValues10 = yValues10;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "yValues1" field.
  double? _yValues1;
  double get yValues1 => _yValues1 ?? 0.0;
  set yValues1(double? val) => _yValues1 = val;

  void incrementYValues1(double amount) => yValues1 = yValues1 + amount;

  bool hasYValues1() => _yValues1 != null;

  // "yValues2" field.
  double? _yValues2;
  double get yValues2 => _yValues2 ?? 0.0;
  set yValues2(double? val) => _yValues2 = val;

  void incrementYValues2(double amount) => yValues2 = yValues2 + amount;

  bool hasYValues2() => _yValues2 != null;

  // "yValues3" field.
  double? _yValues3;
  double get yValues3 => _yValues3 ?? 0.0;
  set yValues3(double? val) => _yValues3 = val;

  void incrementYValues3(double amount) => yValues3 = yValues3 + amount;

  bool hasYValues3() => _yValues3 != null;

  // "yValues4" field.
  double? _yValues4;
  double get yValues4 => _yValues4 ?? 0.0;
  set yValues4(double? val) => _yValues4 = val;

  void incrementYValues4(double amount) => yValues4 = yValues4 + amount;

  bool hasYValues4() => _yValues4 != null;

  // "yValues5" field.
  double? _yValues5;
  double get yValues5 => _yValues5 ?? 0.0;
  set yValues5(double? val) => _yValues5 = val;

  void incrementYValues5(double amount) => yValues5 = yValues5 + amount;

  bool hasYValues5() => _yValues5 != null;

  // "yValues6" field.
  double? _yValues6;
  double get yValues6 => _yValues6 ?? 0.0;
  set yValues6(double? val) => _yValues6 = val;

  void incrementYValues6(double amount) => yValues6 = yValues6 + amount;

  bool hasYValues6() => _yValues6 != null;

  // "yValues7" field.
  double? _yValues7;
  double get yValues7 => _yValues7 ?? 0.0;
  set yValues7(double? val) => _yValues7 = val;

  void incrementYValues7(double amount) => yValues7 = yValues7 + amount;

  bool hasYValues7() => _yValues7 != null;

  // "yValues8" field.
  double? _yValues8;
  double get yValues8 => _yValues8 ?? 0.0;
  set yValues8(double? val) => _yValues8 = val;

  void incrementYValues8(double amount) => yValues8 = yValues8 + amount;

  bool hasYValues8() => _yValues8 != null;

  // "yValues9" field.
  double? _yValues9;
  double get yValues9 => _yValues9 ?? 0.0;
  set yValues9(double? val) => _yValues9 = val;

  void incrementYValues9(double amount) => yValues9 = yValues9 + amount;

  bool hasYValues9() => _yValues9 != null;

  // "yValues10" field.
  double? _yValues10;
  double get yValues10 => _yValues10 ?? 0.0;
  set yValues10(double? val) => _yValues10 = val;

  void incrementYValues10(double amount) => yValues10 = yValues10 + amount;

  bool hasYValues10() => _yValues10 != null;

  static BarChartDataStruct fromMap(Map<String, dynamic> data) =>
      BarChartDataStruct(
        label: data['label'] as String?,
        yValues1: castToType<double>(data['yValues1']),
        yValues2: castToType<double>(data['yValues2']),
        yValues3: castToType<double>(data['yValues3']),
        yValues4: castToType<double>(data['yValues4']),
        yValues5: castToType<double>(data['yValues5']),
        yValues6: castToType<double>(data['yValues6']),
        yValues7: castToType<double>(data['yValues7']),
        yValues8: castToType<double>(data['yValues8']),
        yValues9: castToType<double>(data['yValues9']),
        yValues10: castToType<double>(data['yValues10']),
      );

  static BarChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BarChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'yValues1': _yValues1,
        'yValues2': _yValues2,
        'yValues3': _yValues3,
        'yValues4': _yValues4,
        'yValues5': _yValues5,
        'yValues6': _yValues6,
        'yValues7': _yValues7,
        'yValues8': _yValues8,
        'yValues9': _yValues9,
        'yValues10': _yValues10,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'yValues1': serializeParam(
          _yValues1,
          ParamType.double,
        ),
        'yValues2': serializeParam(
          _yValues2,
          ParamType.double,
        ),
        'yValues3': serializeParam(
          _yValues3,
          ParamType.double,
        ),
        'yValues4': serializeParam(
          _yValues4,
          ParamType.double,
        ),
        'yValues5': serializeParam(
          _yValues5,
          ParamType.double,
        ),
        'yValues6': serializeParam(
          _yValues6,
          ParamType.double,
        ),
        'yValues7': serializeParam(
          _yValues7,
          ParamType.double,
        ),
        'yValues8': serializeParam(
          _yValues8,
          ParamType.double,
        ),
        'yValues9': serializeParam(
          _yValues9,
          ParamType.double,
        ),
        'yValues10': serializeParam(
          _yValues10,
          ParamType.double,
        ),
      }.withoutNulls;

  static BarChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarChartDataStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        yValues1: deserializeParam(
          data['yValues1'],
          ParamType.double,
          false,
        ),
        yValues2: deserializeParam(
          data['yValues2'],
          ParamType.double,
          false,
        ),
        yValues3: deserializeParam(
          data['yValues3'],
          ParamType.double,
          false,
        ),
        yValues4: deserializeParam(
          data['yValues4'],
          ParamType.double,
          false,
        ),
        yValues5: deserializeParam(
          data['yValues5'],
          ParamType.double,
          false,
        ),
        yValues6: deserializeParam(
          data['yValues6'],
          ParamType.double,
          false,
        ),
        yValues7: deserializeParam(
          data['yValues7'],
          ParamType.double,
          false,
        ),
        yValues8: deserializeParam(
          data['yValues8'],
          ParamType.double,
          false,
        ),
        yValues9: deserializeParam(
          data['yValues9'],
          ParamType.double,
          false,
        ),
        yValues10: deserializeParam(
          data['yValues10'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BarChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarChartDataStruct &&
        label == other.label &&
        yValues1 == other.yValues1 &&
        yValues2 == other.yValues2 &&
        yValues3 == other.yValues3 &&
        yValues4 == other.yValues4 &&
        yValues5 == other.yValues5 &&
        yValues6 == other.yValues6 &&
        yValues7 == other.yValues7 &&
        yValues8 == other.yValues8 &&
        yValues9 == other.yValues9 &&
        yValues10 == other.yValues10;
  }

  @override
  int get hashCode => const ListEquality().hash([
        label,
        yValues1,
        yValues2,
        yValues3,
        yValues4,
        yValues5,
        yValues6,
        yValues7,
        yValues8,
        yValues9,
        yValues10
      ]);
}

BarChartDataStruct createBarChartDataStruct({
  String? label,
  double? yValues1,
  double? yValues2,
  double? yValues3,
  double? yValues4,
  double? yValues5,
  double? yValues6,
  double? yValues7,
  double? yValues8,
  double? yValues9,
  double? yValues10,
}) =>
    BarChartDataStruct(
      label: label,
      yValues1: yValues1,
      yValues2: yValues2,
      yValues3: yValues3,
      yValues4: yValues4,
      yValues5: yValues5,
      yValues6: yValues6,
      yValues7: yValues7,
      yValues8: yValues8,
      yValues9: yValues9,
      yValues10: yValues10,
    );
