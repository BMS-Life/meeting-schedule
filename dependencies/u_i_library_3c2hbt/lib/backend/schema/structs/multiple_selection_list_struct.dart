// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultipleSelectionListStruct extends BaseStruct {
  MultipleSelectionListStruct({
    String? image,
    String? title,
    String? description,
    bool? checkboxValue,
  })  : _image = image,
        _title = title,
        _description = description,
        _checkboxValue = checkboxValue;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "checkboxValue" field.
  bool? _checkboxValue;
  bool get checkboxValue => _checkboxValue ?? false;
  set checkboxValue(bool? val) => _checkboxValue = val;

  bool hasCheckboxValue() => _checkboxValue != null;

  static MultipleSelectionListStruct fromMap(Map<String, dynamic> data) =>
      MultipleSelectionListStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        checkboxValue: data['checkboxValue'] as bool?,
      );

  static MultipleSelectionListStruct? maybeFromMap(dynamic data) => data is Map
      ? MultipleSelectionListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'description': _description,
        'checkboxValue': _checkboxValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'checkboxValue': serializeParam(
          _checkboxValue,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MultipleSelectionListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MultipleSelectionListStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        checkboxValue: deserializeParam(
          data['checkboxValue'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MultipleSelectionListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MultipleSelectionListStruct &&
        image == other.image &&
        title == other.title &&
        description == other.description &&
        checkboxValue == other.checkboxValue;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, description, checkboxValue]);
}

MultipleSelectionListStruct createMultipleSelectionListStruct({
  String? image,
  String? title,
  String? description,
  bool? checkboxValue,
}) =>
    MultipleSelectionListStruct(
      image: image,
      title: title,
      description: description,
      checkboxValue: checkboxValue,
    );
