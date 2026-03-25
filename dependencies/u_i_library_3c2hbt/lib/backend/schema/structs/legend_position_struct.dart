// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LegendPositionStruct extends BaseStruct {
  LegendPositionStruct({
    String? top,
    String? left,
    String? right,
    String? bottom,
  })  : _top = top,
        _left = left,
        _right = right,
        _bottom = bottom;

  // "top" field.
  String? _top;
  String get top => _top ?? 'LegendPosition.top';
  set top(String? val) => _top = val;

  bool hasTop() => _top != null;

  // "left" field.
  String? _left;
  String get left => _left ?? 'LegendPosition.left';
  set left(String? val) => _left = val;

  bool hasLeft() => _left != null;

  // "right" field.
  String? _right;
  String get right => _right ?? 'LegendPosition.right';
  set right(String? val) => _right = val;

  bool hasRight() => _right != null;

  // "bottom" field.
  String? _bottom;
  String get bottom => _bottom ?? 'LegendPosition.bottom';
  set bottom(String? val) => _bottom = val;

  bool hasBottom() => _bottom != null;

  static LegendPositionStruct fromMap(Map<String, dynamic> data) =>
      LegendPositionStruct(
        top: data['top'] as String?,
        left: data['left'] as String?,
        right: data['right'] as String?,
        bottom: data['bottom'] as String?,
      );

  static LegendPositionStruct? maybeFromMap(dynamic data) => data is Map
      ? LegendPositionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'top': _top,
        'left': _left,
        'right': _right,
        'bottom': _bottom,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'top': serializeParam(
          _top,
          ParamType.String,
        ),
        'left': serializeParam(
          _left,
          ParamType.String,
        ),
        'right': serializeParam(
          _right,
          ParamType.String,
        ),
        'bottom': serializeParam(
          _bottom,
          ParamType.String,
        ),
      }.withoutNulls;

  static LegendPositionStruct fromSerializableMap(Map<String, dynamic> data) =>
      LegendPositionStruct(
        top: deserializeParam(
          data['top'],
          ParamType.String,
          false,
        ),
        left: deserializeParam(
          data['left'],
          ParamType.String,
          false,
        ),
        right: deserializeParam(
          data['right'],
          ParamType.String,
          false,
        ),
        bottom: deserializeParam(
          data['bottom'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LegendPositionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LegendPositionStruct &&
        top == other.top &&
        left == other.left &&
        right == other.right &&
        bottom == other.bottom;
  }

  @override
  int get hashCode => const ListEquality().hash([top, left, right, bottom]);
}

LegendPositionStruct createLegendPositionStruct({
  String? top,
  String? left,
  String? right,
  String? bottom,
}) =>
    LegendPositionStruct(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    );
