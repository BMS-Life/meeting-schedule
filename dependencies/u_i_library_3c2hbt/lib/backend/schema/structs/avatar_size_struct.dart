// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvatarSizeStruct extends BaseStruct {
  AvatarSizeStruct({
    AvatarSize? size,
  }) : _size = size;

  // "size" field.
  AvatarSize? _size;
  AvatarSize get size => _size ?? AvatarSize.xl;
  set size(AvatarSize? val) => _size = val;

  bool hasSize() => _size != null;

  static AvatarSizeStruct fromMap(Map<String, dynamic> data) =>
      AvatarSizeStruct(
        size: data['size'] is AvatarSize
            ? data['size']
            : deserializeEnum<AvatarSize>(data['size']),
      );

  static AvatarSizeStruct? maybeFromMap(dynamic data) => data is Map
      ? AvatarSizeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'size': _size?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'size': serializeParam(
          _size,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static AvatarSizeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvatarSizeStruct(
        size: deserializeParam<AvatarSize>(
          data['size'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'AvatarSizeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvatarSizeStruct && size == other.size;
  }

  @override
  int get hashCode => const ListEquality().hash([size]);
}

AvatarSizeStruct createAvatarSizeStruct({
  AvatarSize? size,
}) =>
    AvatarSizeStruct(
      size: size,
    );
