// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class LightLineChart extends StatefulWidget {
  const LightLineChart({
    super.key,
    this.width,
    this.height,
    this.data,
    this.lineColor,
    this.gradientStartColor,
    this.gradientEndColor,
    this.lineCurve,
  });

  final double? width;
  final double? height;
  final List<double>? data;
  final Color? lineColor;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? lineCurve;

  @override
  State<LightLineChart> createState() => _LightLineChartState();
}

class _LightLineChartState extends State<LightLineChart> {
  late List<_Point> _points;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();

    final defaultData = <double>[
      5,
      6,
      5,
      7,
      4,
      3,
      9,
      5,
      6,
      5,
      7,
      8,
      4,
      5,
      3,
      4,
      11,
      10,
      2,
      12,
      4,
      7,
      6,
      8,
    ];

    final data = widget.data ?? defaultData;

    _points = List<_Point>.generate(
      data.length,
      (i) => _Point(i, data[i]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color line = widget.lineColor ?? const Color(0xFF3B82F6);
    final Color gStart = widget.gradientStartColor ?? line;
    final Color gEnd = widget.gradientEndColor ?? line.withOpacity(0.08);
    final int maxX = _points.isNotEmpty ? _points.last.x : 0;

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(
          isVisible: false,
          minimum: 0,
          maximum: maxX.toDouble(),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
          minimum: null,
          maximum: null,
        ),
        series: <SplineAreaSeries<_Point, num>>[
          SplineAreaSeries<_Point, num>(
            dataSource: _points,
            xValueMapper: (_Point p, _) => p.x,
            yValueMapper: (_Point p, _) => p.y,
            splineType: SplineType.cardinal,
            cardinalSplineTension: widget.lineCurve ?? 0.5,
            borderColor: line,
            borderWidth: 2,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gStart.withOpacity(0.45),
                gEnd.withOpacity(0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Point {
  final int x;
  final double y;
  _Point(this.x, this.y);
}
