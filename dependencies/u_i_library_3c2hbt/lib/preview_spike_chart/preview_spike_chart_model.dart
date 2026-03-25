import '/components/card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'preview_spike_chart_widget.dart' show PreviewSpikeChartWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreviewSpikeChartModel extends FlutterFlowModel<PreviewSpikeChartWidget> {
  ///  Local state fields for this page.

  List<double> vital = [65.0, 70.0, 71.0, 68.0, 70.0];
  void addToVital(double item) => vital.add(item);
  void removeFromVital(double item) => vital.remove(item);
  void removeAtIndexFromVital(int index) => vital.removeAt(index);
  void insertAtIndexInVital(int index, double item) =>
      vital.insert(index, item);
  void updateVitalAtIndex(int index, Function(double) updateFn) =>
      vital[index] = updateFn(vital[index]);

  List<double> bp = [120.0, 125.0, 124.0, 123.0, 125.0];
  void addToBp(double item) => bp.add(item);
  void removeFromBp(double item) => bp.remove(item);
  void removeAtIndexFromBp(int index) => bp.removeAt(index);
  void insertAtIndexInBp(int index, double item) => bp.insert(index, item);
  void updateBpAtIndex(int index, Function(double) updateFn) =>
      bp[index] = updateFn(bp[index]);

  List<double> bw = [72.4, 72.5, 73.0, 73.1, 73.4];
  void addToBw(double item) => bw.add(item);
  void removeFromBw(double item) => bw.remove(item);
  void removeAtIndexFromBw(int index) => bw.removeAt(index);
  void insertAtIndexInBw(int index, double item) => bw.insert(index, item);
  void updateBwAtIndex(int index, Function(double) updateFn) =>
      bw[index] = updateFn(bw[index]);

  bool skeleton = true;

  ///  State fields for stateful widgets in this page.

  // Model for card component.
  late CardModel cardModel;

  @override
  void initState(BuildContext context) {
    cardModel = createModel(context, () => CardModel());
  }

  @override
  void dispose() {
    cardModel.dispose();
  }
}
