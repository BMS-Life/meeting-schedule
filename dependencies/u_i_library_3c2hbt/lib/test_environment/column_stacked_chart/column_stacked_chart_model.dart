import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'column_stacked_chart_widget.dart' show ColumnStackedChartWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ColumnStackedChartModel
    extends FlutterFlowModel<ColumnStackedChartWidget> {
  ///  Local state fields for this page.

  List<ColumnStackedChartDataStruct> myColumnStackedChart = [];
  void addToMyColumnStackedChart(ColumnStackedChartDataStruct item) =>
      myColumnStackedChart.add(item);
  void removeFromMyColumnStackedChart(ColumnStackedChartDataStruct item) =>
      myColumnStackedChart.remove(item);
  void removeAtIndexFromMyColumnStackedChart(int index) =>
      myColumnStackedChart.removeAt(index);
  void insertAtIndexInMyColumnStackedChart(
          int index, ColumnStackedChartDataStruct item) =>
      myColumnStackedChart.insert(index, item);
  void updateMyColumnStackedChartAtIndex(
          int index, Function(ColumnStackedChartDataStruct) updateFn) =>
      myColumnStackedChart[index] = updateFn(myColumnStackedChart[index]);

  List<Color> chartColor = [Color(4283120111), Color(4289636607)];
  void addToChartColor(Color item) => chartColor.add(item);
  void removeFromChartColor(Color item) => chartColor.remove(item);
  void removeAtIndexFromChartColor(int index) => chartColor.removeAt(index);
  void insertAtIndexInChartColor(int index, Color item) =>
      chartColor.insert(index, item);
  void updateChartColorAtIndex(int index, Function(Color) updateFn) =>
      chartColor[index] = updateFn(chartColor[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
