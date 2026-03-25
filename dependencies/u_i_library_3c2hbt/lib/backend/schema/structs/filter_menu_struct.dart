// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterMenuStruct extends BaseStruct {
  FilterMenuStruct({
    String? filterName,
  }) : _filterName = filterName;

  // "filterName" field.
  String? _filterName;
  String get filterName => _filterName ?? '';
  set filterName(String? val) => _filterName = val;

  bool hasFilterName() => _filterName != null;

  static FilterMenuStruct fromMap(Map<String, dynamic> data) =>
      FilterMenuStruct(
        filterName: data['filterName'] as String?,
      );

  static FilterMenuStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterMenuStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filterName': _filterName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filterName': serializeParam(
          _filterName,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilterMenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterMenuStruct(
        filterName: deserializeParam(
          data['filterName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilterMenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterMenuStruct && filterName == other.filterName;
  }

  @override
  int get hashCode => const ListEquality().hash([filterName]);
}

FilterMenuStruct createFilterMenuStruct({
  String? filterName,
}) =>
    FilterMenuStruct(
      filterName: filterName,
    );
