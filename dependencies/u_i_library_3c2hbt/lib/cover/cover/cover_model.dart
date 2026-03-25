import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cover_widget.dart' show CoverWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoverModel extends FlutterFlowModel<CoverWidget> {
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
