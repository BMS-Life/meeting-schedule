import '/components/static_label_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'ripple_demo_widget.dart' show RippleDemoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RippleDemoModel extends FlutterFlowModel<RippleDemoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StaticLabel component.
  late StaticLabelModel staticLabelModel;

  @override
  void initState(BuildContext context) {
    staticLabelModel = createModel(context, () => StaticLabelModel());
  }

  @override
  void dispose() {
    staticLabelModel.dispose();
  }
}
