// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonutChartDataStruct extends BaseStruct {
  DonutChartDataStruct({
    String? xTitle,
    double? yValue,
  })  : _xTitle = xTitle,
        _yValue = yValue;

  // "xTitle" field.
  String? _xTitle;
  String get xTitle => _xTitle ?? '';
  set xTitle(String? val) => _xTitle = val;

  bool hasXTitle() => _xTitle != null;

  // "yValue" field.
  double? _yValue;
  double get yValue => _yValue ?? 0.0;
  set yValue(double? val) => _yValue = val;

  void incrementYValue(double amount) => yValue = yValue + amount;

  bool hasYValue() => _yValue != null;

  static DonutChartDataStruct fromMap(Map<String, dynamic> data) =>
      DonutChartDataStruct(
        xTitle: data['xTitle'] as String?,
        yValue: castToType<double>(data['yValue']),
      );

  static DonutChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DonutChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'xTitle': _xTitle,
        'yValue': _yValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xTitle': serializeParam(
          _xTitle,
          ParamType.String,
        ),
        'yValue': serializeParam(
          _yValue,
          ParamType.double,
        ),
      }.withoutNulls;

  static DonutChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DonutChartDataStruct(
        xTitle: deserializeParam(
          data['xTitle'],
          ParamType.String,
          false,
        ),
        yValue: deserializeParam(
          data['yValue'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DonutChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DonutChartDataStruct &&
        xTitle == other.xTitle &&
        yValue == other.yValue;
  }

  @override
  int get hashCode => const ListEquality().hash([xTitle, yValue]);
}

DonutChartDataStruct createDonutChartDataStruct({
  String? xTitle,
  double? yValue,
}) =>
    DonutChartDataStruct(
      xTitle: xTitle,
      yValue: yValue,
    );
