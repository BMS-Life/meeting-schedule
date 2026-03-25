// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart' as sf;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // สำหรับ number format

class LineChart extends StatefulWidget {
  const LineChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    this.chartColors = const [],
    this.min,
    this.max,
    this.interval,
    this.seriesName1,
    this.seriesName2,
    this.seriesName3,
    this.seriesName4,
    this.seriesName5,
    this.xAxisSize,
    this.xAxisColor,
    this.yAxisSize,
    this.yAxisColor,
    this.lineCurve,
    this.tooltipMode,
    this.tooltipColor,
    this.tooltipTextColor,
    this.tooltipTextSize,
    this.chartAlignment,
    this.showLabels,
    this.labelTextSize,
    this.labelTextColor,
    this.labelAlignment,
    this.showLegend,
    this.legendPosition,
    this.legendTextSize,
    this.legendTextColor,
    this.chartGradient1,
    this.chartGradient2,
  });

  final double? width;
  final double? height;
  final List<LineChartStruct> chartData;
  final List<Color> chartColors;
  final double? min;
  final double? max;
  final double? interval;
  final String? seriesName1;
  final String? seriesName2;
  final String? seriesName3;
  final String? seriesName4;
  final String? seriesName5;
  final double? xAxisSize;
  final Color? xAxisColor;
  final double? yAxisSize;
  final Color? yAxisColor;
  final double? lineCurve;
  final TooltipDisplayMode? tooltipMode;
  final Color? tooltipColor;
  final Color? tooltipTextColor;
  final double? tooltipTextSize;
  final bool? showLabels;
  final double? labelTextSize;
  final Color? labelTextColor;
  final ChartDataLabelAlignment? labelAlignment;
  final bool? showLegend;
  final LegendDirection? legendPosition;
  final double? legendTextSize;
  final Color? legendTextColor;
  final double? chartGradient1;
  final double? chartGradient2;
  final ChartAlignment? chartAlignment;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late sf.TooltipBehavior _tooltipBehavior;
  late sf.TrackballBehavior _trackballBehavior;

  // Syncfusion default colors
  final List<Color> defaultColors = [
    const Color(0xFF0F62FE),
    const Color(0xFF24A148),
    const Color(0xFFF1C21B),
    const Color(0xFF8A3FFC),
    const Color(0xFFD32F2F),
  ];

  late List<Color> seriesColors;

  final NumberFormat thousandFormat =
      NumberFormat.decimalPattern(); // สำหรับหลักพัน

  // Mapping TrackballDisplayMode from sf with enum
  sf.TrackballDisplayMode mapTooltipMode(Enum? alignment) {
    switch (alignment?.name) {
      case 'floatAllPoints':
        return sf.TrackballDisplayMode.floatAllPoints;
      case 'groupAllPoints':
        return sf.TrackballDisplayMode.groupAllPoints;
      case 'nearestPoint':
        return sf.TrackballDisplayMode.nearestPoint;
      case 'none':
        return sf.TrackballDisplayMode.none;
      default:
        return sf.TrackballDisplayMode.floatAllPoints;
    }
  }

  // Mapping LegendPosition from sf with enum
  sf.LegendPosition mapLegendPosition(Enum? alignment) {
    switch (alignment?.name) {
      case 'left':
        return sf.LegendPosition.left;
      case 'top':
        return sf.LegendPosition.top;
      case 'right':
        return sf.LegendPosition.right;
      case 'bottom':
        return sf.LegendPosition.bottom;
      default:
        return sf.LegendPosition.right;
    }
  }

  // Mapping ChartAlignment from sf with enum
  sf.ChartAlignment mapChartAlignment(Enum? alignment) {
    switch (alignment?.name) {
      case 'near':
        return sf.ChartAlignment.near;
      case 'center':
        return sf.ChartAlignment.center;
      case 'far':
        return sf.ChartAlignment.far;

      default:
        return sf.ChartAlignment.center;
    }
  }

  // Mapping LabelAlignment from sf with enum
  sf.ChartDataLabelAlignment mapAlignment(Enum? alignment) {
    switch (alignment?.name) {
      case 'top':
        return sf.ChartDataLabelAlignment.top;
      case 'bottom':
        return sf.ChartDataLabelAlignment.bottom;
      case 'outer':
        return sf.ChartDataLabelAlignment.outer;
      case 'auto':
        return sf.ChartDataLabelAlignment.auto;
      default:
        return sf.ChartDataLabelAlignment.top;
    }
  }

  @override
  void initState() {
    super.initState();

    // Prepare final series colors: user-provided or defaults
    seriesColors = List.generate(
      5,
      (i) => widget.chartColors.length > i
          ? widget.chartColors[i]
          : defaultColors[i % defaultColors.length],
    );

    _tooltipBehavior = sf.TooltipBehavior(
      enable: true,
      header: '',
      canShowMarker: false, // Disable marker icon
      // textStyle: GoogleFonts.ibmPlexSansThaiLooped(
      //   color: Colors.white,
      //   fontSize: 20,
      //   fontWeight: FontWeight.w500,
      // ),
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '${data.x} : ${data.y != null ? thousandFormat.format(data.y) : '-'}',
            style: GoogleFonts.ibmPlexSansThaiLooped(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );

    _trackballBehavior = sf.TrackballBehavior(
      enable: true,
      activationMode: sf.ActivationMode.singleTap,
      tooltipDisplayMode: mapTooltipMode(widget.tooltipMode),
      tooltipSettings: sf.InteractiveTooltip(
        enable: true,
        color: widget.tooltipColor ?? Colors.black87,
        borderRadius: 6,
        textStyle: GoogleFonts.ibmPlexSansThaiLooped(
          color: widget.tooltipTextColor ?? Colors.white,
          fontSize: widget.tooltipTextSize ?? 12,
          fontWeight: FontWeight.w500,
        ),
        canShowMarker: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: sf.SfCartesianChart(
        plotAreaBorderWidth: 0,
        tooltipBehavior: _tooltipBehavior,
        trackballBehavior: _trackballBehavior,
        primaryXAxis: sf.CategoryAxis(
          labelPlacement: sf.LabelPlacement.onTicks,
          majorGridLines: const sf.MajorGridLines(width: 0),
          labelStyle: GoogleFonts.ibmPlexSansThaiLooped(
            fontSize: widget.xAxisSize ?? 12,
            fontWeight: FontWeight.w500,
            color: widget.xAxisColor ?? Colors.black87,
          ),
        ),
        primaryYAxis: sf.NumericAxis(
          minimum: widget.min ?? 0,
          maximum: widget.max ?? 1000,
          interval: widget.interval ?? 200,
          axisLine: const sf.AxisLine(width: 0),
          majorTickLines: const sf.MajorTickLines(size: 0),
          numberFormat: thousandFormat, // <-- format หลักพัน
          labelStyle: GoogleFonts.ibmPlexSansThaiLooped(
            fontSize: widget.yAxisSize ?? 12,
            fontWeight: FontWeight.w500,
            color: widget.yAxisColor ?? Colors.black87,
          ),
        ),
        legend: sf.Legend(
          isVisible: widget.showLegend ?? true,
          position: mapLegendPosition(widget.legendPosition),
          alignment: mapChartAlignment(widget.chartAlignment),
          legendItemBuilder:
              (String name, dynamic series, dynamic point, int index) {
            final sf.SplineAreaSeries s = series as sf.SplineAreaSeries;
            final Color color = s.borderColor as Color;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  name,
                  style: GoogleFonts.ibmPlexSansThaiLooped(
                    fontSize: widget.legendTextSize ?? 12,
                    fontWeight: FontWeight.w500,
                    color: widget.legendTextColor ?? Colors.black87,
                  ),
                ),
              ],
            );
          },
        ),
        series: _buildDynamicSeries(),
      ),
    );
  }

  List<sf.SplineAreaSeries<_ChartData, String>> _buildDynamicSeries() {
    final seriesList = <sf.SplineAreaSeries<_ChartData, String>>[];

    final yAccessors = <double? Function(LineChartStruct)>[
      (LineChartStruct e) => e.yValue1,
      (LineChartStruct e) => e.yValue2,
      (LineChartStruct e) => e.yValue3,
      (LineChartStruct e) => e.yValue4,
      (LineChartStruct e) => e.yValue5,
    ];

    final seriesNames = <String?>[
      widget.seriesName1,
      widget.seriesName2,
      widget.seriesName3,
      widget.seriesName4,
      widget.seriesName5,
    ];

    for (int i = 0; i < yAccessors.length; i++) {
      final name = seriesNames[i];
      if (name == null || name.trim().isEmpty) continue;

      final data = widget.chartData
          .map((e) => _ChartData(e.xTitle, yAccessors[i](e)))
          .where((d) => d.y != null)
          .toList();

      if (data.isEmpty) continue;

      final baseColor = seriesColors[i % seriesColors.length];

      seriesList.add(
        sf.SplineAreaSeries<_ChartData, String>(
          name: name,
          dataSource: data,
          xValueMapper: (d, _) => d.x,
          yValueMapper: (d, _) => d.y,
          gradient: LinearGradient(
            colors: [
              baseColor.withOpacity(widget.chartGradient1 ?? 0.1),
              baseColor.withOpacity(widget.chartGradient2 ?? 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: baseColor,
          borderWidth: 2,
          splineType: sf.SplineType.cardinal,
          cardinalSplineTension: widget.lineCurve ?? .8,
          markerSettings: sf.MarkerSettings(
            isVisible: true,
            color: baseColor,
            borderColor: Colors.white,
            borderWidth: 1.5,
          ),
          dataLabelSettings: sf.DataLabelSettings(
            isVisible: widget.showLabels ?? false,
            labelAlignment: mapAlignment(widget.labelAlignment),
            textStyle: GoogleFonts.ibmPlexSansThaiLooped(
              fontSize: widget.labelTextSize ?? 10,
              fontWeight: FontWeight.w500,
              color: widget.labelTextColor ?? Colors.black87,
            ),
            builder: (dynamic data, dynamic point, dynamic series,
                int pointIndex, int seriesIndex) {
              return Text(
                data.y != null ? thousandFormat.format(data.y) : '-',
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  fontSize: widget.labelTextSize ?? 10,
                  fontWeight: FontWeight.w500,
                  color: widget.labelTextColor ?? Colors.black87,
                ),
              );
            },
          ),
        ),
      );
    }

    return seriesList;
  }
}

class _ChartData {
  final String x;
  final double? y;
  _ChartData(this.x, this.y);
}
