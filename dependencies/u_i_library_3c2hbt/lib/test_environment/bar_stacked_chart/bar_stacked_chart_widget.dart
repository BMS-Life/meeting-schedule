import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bar_stacked_chart_model.dart';
export 'bar_stacked_chart_model.dart';

class BarStackedChartWidget extends StatefulWidget {
  const BarStackedChartWidget({super.key});

  static String routeName = 'BarStackedChart';
  static String routePath = '/barStackedChart';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<BarStackedChartWidget> createState() => _BarStackedChartWidgetState();
}

class _BarStackedChartWidgetState extends State<BarStackedChartWidget> {
  late BarStackedChartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BarStackedChartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.myBarStackedChart = [];
          safeSetState(() {});
        }),
      ]);
      await Future.wait([
        Future(() async {
          _model.addToMyBarStackedChart(BarStackedChartStruct(
            xTitle: 'คลินิกเอกชน',
            yValue1: 8.0,
            yValue2: 20.0,
          ));
          safeSetState(() {});
          _model.addToMyBarStackedChart(BarStackedChartStruct(
            xTitle: 'โรงพยาบาลนอกสธ.',
            yValue1: 50.0,
          ));
          safeSetState(() {});
          _model.addToMyBarStackedChart(BarStackedChartStruct(
            xTitle: 'โรงพยาบาลนอกสป.สธ.',
            yValue1: 16.0,
          ));
          safeSetState(() {});
          _model.addToMyBarStackedChart(BarStackedChartStruct(
            xTitle: 'โรงพยาบาลชุมชน',
            yValue1: 20.0,
          ));
          safeSetState(() {});
          _model.addToMyBarStackedChart(BarStackedChartStruct(
            xTitle: 'โรงพยาบาลทั่วไป',
            yValue1: 15.0,
          ));
          safeSetState(() {});
        }),
      ]);
    });

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(64.0, 0.0, 64.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      child: custom_widgets.BarStackedChart(
                        width: double.infinity,
                        height: 500.0,
                        chartData: _model.myBarStackedChart,
                        chartColor: _model.chartColor,
                        seriesName1: 'series1',
                        seriesName2: '',
                        seriesName3: '',
                        seriesName4: '',
                        min: 0.0,
                        max: 50.0,
                        interval: 5.0,
                        showLabels: true,
                        labelFontColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        showLegend: true,
                        legendDirection: LegendDirection.top,
                        labelAlignment: ChartDataLabelAlignment.top,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
