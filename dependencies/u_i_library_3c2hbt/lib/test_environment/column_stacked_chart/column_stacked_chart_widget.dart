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
import 'column_stacked_chart_model.dart';
export 'column_stacked_chart_model.dart';

class ColumnStackedChartWidget extends StatefulWidget {
  const ColumnStackedChartWidget({super.key});

  static String routeName = 'ColumnStackedChart';
  static String routePath = '/columnStackedChart';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<ColumnStackedChartWidget> createState() =>
      _ColumnStackedChartWidgetState();
}

class _ColumnStackedChartWidgetState extends State<ColumnStackedChartWidget> {
  late ColumnStackedChartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColumnStackedChartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.myColumnStackedChart = [];
          safeSetState(() {});
        }),
      ]);
      await Future.wait([
        Future(() async {
          _model.addToMyColumnStackedChart(ColumnStackedChartDataStruct(
            xTitle: 'เขต 1',
            yValue1: 5.0,
            yValue2: 3.0,
          ));
          safeSetState(() {});
          _model.addToMyColumnStackedChart(ColumnStackedChartDataStruct(
            xTitle: 'เขต 2',
            yValue1: 12.0,
            yValue2: 2.0,
          ));
          safeSetState(() {});
          _model.addToMyColumnStackedChart(ColumnStackedChartDataStruct(
            xTitle: 'เขต 3',
            yValue1: 16.0,
            yValue2: 4.0,
          ));
          safeSetState(() {});
          _model.addToMyColumnStackedChart(ColumnStackedChartDataStruct(
            xTitle: 'เขต 4',
            yValue1: 20.0,
            yValue2: 8.0,
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
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 650.0,
                        child: custom_widgets.ColumnStackedChart(
                          width: double.infinity,
                          height: 650.0,
                          chartData: _model.myColumnStackedChart,
                          min: 0.0,
                          max: 30.0,
                          interval: 5.0,
                          seriesName1: 'ส่งเข้า MOPH ตรงเวลา',
                          seriesName2: 'ส่งเข้า MOPH ล่าช้า',
                          showLabels: true,
                          labelFontSize: 16.0,
                          labelFontColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          showLegend: true,
                          legendFontSize: 14.0,
                          labelAlignment: ChartDataLabelAlignment.top,
                          chartColor: _model.chartColor,
                          legendDirection: LegendDirection.top,
                        ),
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
