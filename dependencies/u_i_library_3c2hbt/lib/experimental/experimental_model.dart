import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/otp_widget.dart';
import '/display/dialog/dialog_image/dialog_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/illustration/medicine_shopping_confirm/medicine_shopping_confirm_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'experimental_widget.dart' show ExperimentalWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExperimentalModel extends FlutterFlowModel<ExperimentalWidget> {
  ///  Local state fields for this page.

  List<BarChartDataStruct> chartData = [];
  void addToChartData(BarChartDataStruct item) => chartData.add(item);
  void removeFromChartData(BarChartDataStruct item) => chartData.remove(item);
  void removeAtIndexFromChartData(int index) => chartData.removeAt(index);
  void insertAtIndexInChartData(int index, BarChartDataStruct item) =>
      chartData.insert(index, item);
  void updateChartDataAtIndex(
          int index, Function(BarChartDataStruct) updateFn) =>
      chartData[index] = updateFn(chartData[index]);

  List<Color> chartColor = [];
  void addToChartColor(Color item) => chartColor.add(item);
  void removeFromChartColor(Color item) => chartColor.remove(item);
  void removeAtIndexFromChartColor(int index) => chartColor.removeAt(index);
  void insertAtIndexInChartColor(int index, Color item) =>
      chartColor.insert(index, item);
  void updateChartColorAtIndex(int index, Function(Color) updateFn) =>
      chartColor[index] = updateFn(chartColor[index]);

  List<DonutChartDataStruct> donutChartData = [];
  void addToDonutChartData(DonutChartDataStruct item) =>
      donutChartData.add(item);
  void removeFromDonutChartData(DonutChartDataStruct item) =>
      donutChartData.remove(item);
  void removeAtIndexFromDonutChartData(int index) =>
      donutChartData.removeAt(index);
  void insertAtIndexInDonutChartData(int index, DonutChartDataStruct item) =>
      donutChartData.insert(index, item);
  void updateDonutChartDataAtIndex(
          int index, Function(DonutChartDataStruct) updateFn) =>
      donutChartData[index] = updateFn(donutChartData[index]);

  ///  State fields for stateful widgets in this page.

  // Model for otp component.
  late OtpModel otpModel;

  @override
  void initState(BuildContext context) {
    otpModel = createModel(context, () => OtpModel());
  }

  @override
  void dispose() {
    otpModel.dispose();
  }
}
