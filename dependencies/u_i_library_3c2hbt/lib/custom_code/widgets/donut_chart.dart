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

class DonutChart extends StatefulWidget {
  const DonutChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.chartColors,
    required this.radius,
    required this.innerRadius,
    required this.showLabels,
    this.labelFontSize,
    this.labelFontColor,
    this.labelPosition,
    this.labelFormat,
    this.showPercentage,
    required this.showLegend,
    this.legendFontColor,
    this.legendFontSize,
    this.tooltipPosition,
    this.legendDirection,
    this.tooltipColor,
    this.tooltipFontColor,
    this.tooltipFontSize,
    this.enableExplode,
    this.explodeOffset,
    required this.enableSemi,
  });

  final double? width;
  final double? height;
  final List<DonutChartDataStruct> chartData;
  final List<Color> chartColors;
  final String radius;
  final String innerRadius;
  final bool showLabels;
  final double? labelFontSize;
  final Color? labelFontColor;
  final ChartDataLabelPosition? labelPosition;
  final String? labelFormat;
  final bool? showPercentage;
  final bool showLegend;
  final Color? legendFontColor;
  final double? legendFontSize;
  final LegendDirection? legendDirection;
  final Color? tooltipColor;
  final Color? tooltipFontColor;
  final double? tooltipFontSize;
  final TooltipPosition? tooltipPosition;
  final bool? enableExplode;
  final String? explodeOffset;
  final bool enableSemi;

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  final numberFormatter = NumberFormat('#,###');

  // Mapping LabelAlignment from sf with enum
  sf.ChartDataLabelPosition mapLabelPosition(Enum? alignment) {
    switch (alignment?.name) {
      case 'inside':
        return sf.ChartDataLabelPosition.inside;
      case 'outside':
        return sf.ChartDataLabelPosition.outside;
      default:
        return sf.ChartDataLabelPosition.outside;
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

  // Mapping TooltipPosition from sf with enum
  sf.TooltipPosition mapTooltipPosition(Enum? position) {
    switch (position?.name) {
      case 'auto':
        return sf.TooltipPosition.auto;
      case 'pointer':
        return sf.TooltipPosition.pointer;
      default:
        return sf.TooltipPosition.auto;
    }
  }

  // Total for percent calculation
  double get totalYValue =>
      widget.chartData.fold(0, (sum, item) => sum + (item.yValue ?? 0));

  // Mapping Label Format with optional thousand separator + percentage
  String _mapDataLabel(DonutChartDataStruct data) {
    final rawValue = data.yValue ?? 0;
    final formattedValue = numberFormatter.format(rawValue);

    final percent = totalYValue > 0 ? (rawValue / totalYValue) * 100 : 0;
    final showPercent = widget.showPercentage ?? false;
    final percentStr = '(${percent.toStringAsFixed(1)}%)';

    switch (widget.labelFormat) {
      case 'x':
        return showPercent ? '${data.xTitle} $percentStr' : '${data.xTitle}';

      case 'xy':
        return showPercent
            ? '${data.xTitle}: $formattedValue\n$percentStr'
            : '${data.xTitle}: $formattedValue';

      case 'y':
      default:
        return showPercent ? '$formattedValue $percentStr' : '$formattedValue';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: sf.SfCircularChart(
        legend: sf.Legend(
          textStyle: GoogleFonts.ibmPlexSansThaiLooped(
            fontSize: widget.legendFontSize ?? 12.0,
            color: widget.legendFontColor ?? Colors.black,
          ),
          isVisible: widget.showLegend,
          overflowMode: sf.LegendItemOverflowMode.wrap,
          position: mapLegendPosition(widget.legendDirection),
        ),
        series: <sf.DoughnutSeries<DonutChartDataStruct, String>>[
          sf.DoughnutSeries<DonutChartDataStruct, String>(
            dataSource: widget.chartData,
            xValueMapper: (DonutChartDataStruct data, _) => data.xTitle,
            yValueMapper: (DonutChartDataStruct data, _) => data.yValue,
            pointColorMapper: (DonutChartDataStruct data, int index) =>
                widget.chartColors.length > index
                    ? widget.chartColors[index]
                    : null,
            dataLabelMapper: (DonutChartDataStruct data, _) =>
                _mapDataLabel(data),
            dataLabelSettings: sf.DataLabelSettings(
              isVisible: widget.showLabels,
              labelPosition: mapLabelPosition(widget.labelPosition),
              textStyle: GoogleFonts.ibmPlexSansThaiLooped(
                fontSize: widget.labelFontSize ?? 12,
                color: widget.labelFontColor,
              ),
            ),
            radius: widget.radius,
            innerRadius: widget.innerRadius,
            explode: widget.enableExplode ?? false,
            explodeOffset: widget.explodeOffset ?? '10%',
            startAngle: widget.enableSemi ? 270 : 0,
            endAngle: widget.enableSemi ? 90 : 360,
          ),
        ],
        tooltipBehavior: sf.TooltipBehavior(
          enable: true,
          color: widget.tooltipColor ?? Colors.white,
          tooltipPosition: mapTooltipPosition(widget.tooltipPosition),
          textStyle: GoogleFonts.ibmPlexSansThaiLooped(
            color: widget.tooltipFontColor ?? Colors.black,
            fontSize: widget.tooltipFontSize ?? 12,
          ),
          builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
              int seriesIndex) {
            final DonutChartDataStruct chartData = data as DonutChartDataStruct;
            final formattedValue =
                numberFormatter.format(chartData.yValue ?? 0);
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: widget.tooltipColor ?? Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${chartData.xTitle} : $formattedValue',
                style: GoogleFonts.ibmPlexSansThaiLooped(
                  color: widget.tooltipFontColor ?? Colors.black,
                  fontSize: widget.tooltipFontSize ?? 12,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
