import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multiple_selectable_search_demo_model.dart';
export 'multiple_selectable_search_demo_model.dart';

class MultipleSelectableSearchDemoWidget extends StatefulWidget {
  const MultipleSelectableSearchDemoWidget({super.key});

  static String routeName = 'MultipleSelectableSearchDemo';
  static String routePath = '/multipleSelectableSearchDemo';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<MultipleSelectableSearchDemoWidget> createState() =>
      _MultipleSelectableSearchDemoWidgetState();
}

class _MultipleSelectableSearchDemoWidgetState
    extends State<MultipleSelectableSearchDemoWidget> {
  late MultipleSelectableSearchDemoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultipleSelectableSearchDemoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400.0,
                  height: 300.0,
                  child: custom_widgets.MultiSelectSearch(
                    width: 400.0,
                    height: 300.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
