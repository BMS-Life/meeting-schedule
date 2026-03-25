import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'multiple_section_widget.dart' show MultipleSectionWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MultipleSectionModel extends FlutterFlowModel<MultipleSectionWidget> {
  ///  Local state fields for this component.

  String? titleMapping;

  String? descriptionMapping;

  bool? checkboxMapping;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<MultipleSelectionListStruct, bool> checkboxValueMap = {};
  List<MultipleSelectionListStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
