import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'column_chart_widget.dart' show ColumnChartWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ColumnChartModel extends FlutterFlowModel<ColumnChartWidget> {
  ///  Local state fields for this page.

  List<ColumnChartDataStruct> myColumnChart = [];
  void addToMyColumnChart(ColumnChartDataStruct item) =>
      myColumnChart.add(item);
  void removeFromMyColumnChart(ColumnChartDataStruct item) =>
      myColumnChart.remove(item);
  void removeAtIndexFromMyColumnChart(int index) =>
      myColumnChart.removeAt(index);
  void insertAtIndexInMyColumnChart(int index, ColumnChartDataStruct item) =>
      myColumnChart.insert(index, item);
  void updateMyColumnChartAtIndex(
          int index, Function(ColumnChartDataStruct) updateFn) =>
      myColumnChart[index] = updateFn(myColumnChart[index]);

  List<Color> chartColor = [
    Color(4283120111),
    Color(4281979584),
    Color(4293823328)
  ];
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
