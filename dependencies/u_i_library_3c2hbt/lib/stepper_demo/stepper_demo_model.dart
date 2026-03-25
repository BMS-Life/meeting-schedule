import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'stepper_demo_widget.dart' show StepperDemoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StepperDemoModel extends FlutterFlowModel<StepperDemoWidget> {
  ///  Local state fields for this page.

  List<ColumnChartDataStruct> chartData = [];
  void addToChartData(ColumnChartDataStruct item) => chartData.add(item);
  void removeFromChartData(ColumnChartDataStruct item) =>
      chartData.remove(item);
  void removeAtIndexFromChartData(int index) => chartData.removeAt(index);
  void insertAtIndexInChartData(int index, ColumnChartDataStruct item) =>
      chartData.insert(index, item);
  void updateChartDataAtIndex(
          int index, Function(ColumnChartDataStruct) updateFn) =>
      chartData[index] = updateFn(chartData[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
