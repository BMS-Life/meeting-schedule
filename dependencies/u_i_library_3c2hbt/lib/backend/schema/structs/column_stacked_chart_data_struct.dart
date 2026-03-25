// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColumnStackedChartDataStruct extends BaseStruct {
  ColumnStackedChartDataStruct({
    String? xTitle,
    double? yValue1,
    double? yValue2,
    double? yValue3,
    double? yValue4,
  })  : _xTitle = xTitle,
        _yValue1 = yValue1,
        _yValue2 = yValue2,
        _yValue3 = yValue3,
        _yValue4 = yValue4;

  // "xTitle" field.
  String? _xTitle;
  String get xTitle => _xTitle ?? '';
  set xTitle(String? val) => _xTitle = val;

  bool hasXTitle() => _xTitle != null;

  // "yValue1" field.
  double? _yValue1;
  double get yValue1 => _yValue1 ?? 0.0;
  set yValue1(double? val) => _yValue1 = val;

  void incrementYValue1(double amount) => yValue1 = yValue1 + amount;

  bool hasYValue1() => _yValue1 != null;

  // "yValue2" field.
  double? _yValue2;
  double get yValue2 => _yValue2 ?? 0.0;
  set yValue2(double? val) => _yValue2 = val;

  void incrementYValue2(double amount) => yValue2 = yValue2 + amount;

  bool hasYValue2() => _yValue2 != null;

  // "yValue3" field.
  double? _yValue3;
  double get yValue3 => _yValue3 ?? 0.0;
  set yValue3(double? val) => _yValue3 = val;

  void incrementYValue3(double amount) => yValue3 = yValue3 + amount;

  bool hasYValue3() => _yValue3 != null;

  // "yValue4" field.
  double? _yValue4;
  double get yValue4 => _yValue4 ?? 0.0;
  set yValue4(double? val) => _yValue4 = val;

  void incrementYValue4(double amount) => yValue4 = yValue4 + amount;

  bool hasYValue4() => _yValue4 != null;

  static ColumnStackedChartDataStruct fromMap(Map<String, dynamic> data) =>
      ColumnStackedChartDataStruct(
        xTitle: data['xTitle'] as String?,
        yValue1: castToType<double>(data['yValue1']),
        yValue2: castToType<double>(data['yValue2']),
        yValue3: castToType<double>(data['yValue3']),
        yValue4: castToType<double>(data['yValue4']),
      );

  static ColumnStackedChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ColumnStackedChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'xTitle': _xTitle,
        'yValue1': _yValue1,
        'yValue2': _yValue2,
        'yValue3': _yValue3,
        'yValue4': _yValue4,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xTitle': serializeParam(
          _xTitle,
          ParamType.String,
        ),
        'yValue1': serializeParam(
          _yValue1,
          ParamType.double,
        ),
        'yValue2': serializeParam(
          _yValue2,
          ParamType.double,
        ),
        'yValue3': serializeParam(
          _yValue3,
          ParamType.double,
        ),
        'yValue4': serializeParam(
          _yValue4,
          ParamType.double,
        ),
      }.withoutNulls;

  static ColumnStackedChartDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ColumnStackedChartDataStruct(
        xTitle: deserializeParam(
          data['xTitle'],
          ParamType.String,
          false,
        ),
        yValue1: deserializeParam(
          data['yValue1'],
          ParamType.double,
          false,
        ),
        yValue2: deserializeParam(
          data['yValue2'],
          ParamType.double,
          false,
        ),
        yValue3: deserializeParam(
          data['yValue3'],
          ParamType.double,
          false,
        ),
        yValue4: deserializeParam(
          data['yValue4'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ColumnStackedChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColumnStackedChartDataStruct &&
        xTitle == other.xTitle &&
        yValue1 == other.yValue1 &&
        yValue2 == other.yValue2 &&
        yValue3 == other.yValue3 &&
        yValue4 == other.yValue4;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([xTitle, yValue1, yValue2, yValue3, yValue4]);
}

ColumnStackedChartDataStruct createColumnStackedChartDataStruct({
  String? xTitle,
  double? yValue1,
  double? yValue2,
  double? yValue3,
  double? yValue4,
}) =>
    ColumnStackedChartDataStruct(
      xTitle: xTitle,
      yValue1: yValue1,
      yValue2: yValue2,
      yValue3: yValue3,
      yValue4: yValue4,
    );
