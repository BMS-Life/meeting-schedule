import '/components/static_label_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'static_label_demo_widget.dart' show StaticLabelDemoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaticLabelDemoModel extends FlutterFlowModel<StaticLabelDemoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StaticLabel component.
  late StaticLabelModel staticLabelModel1;
  // Model for StaticLabel component.
  late StaticLabelModel staticLabelModel2;

  @override
  void initState(BuildContext context) {
    staticLabelModel1 = createModel(context, () => StaticLabelModel());
    staticLabelModel2 = createModel(context, () => StaticLabelModel());
  }

  @override
  void dispose() {
    staticLabelModel1.dispose();
    staticLabelModel2.dispose();
  }
}
