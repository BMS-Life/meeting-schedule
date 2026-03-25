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
import 'package:intl/intl.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.chartColors,
    this.seriesNames1,
    this.seriesNames2,
    this.seriesNames3,
    this.seriesNames4,
    this.seriesNames5,
    this.min,
    this.max,
    this.interval,
    this.columnWidth = 0.6,
    this.showLabels = true,
    this.labelAlignment,
    this.labelFontSize = 12.0,
    this.labelFontColor = Colors.black,
    this.borderRadius = 8.0,
    this.axisFontSize = 12.0,
    this.axisRotation,
    this.axisTitleColor = Colors.black,
    this.showLegend = true,
    this.legendDirection,
    this.legendFontSize = 12.0,
    this.tooltipFontSize = 12.0,
    this.tooltipColor = Colors.black,
    this.tooltipFontColor = Colors.white,
    this.tooltipPosition,
  });

  final double? width;
  final double? height;
  final List<ColumnChartDataStruct> chartData;
  final List<Color> chartColors;
  final String? seriesNames1;
  final String? seriesNames2;
  final String? seriesNames3;
  final String? seriesNames4;
  final String? seriesNames5;
  final double? min;
  final double? max;
  final double? interval;
  final double? columnWidth;
  final bool? showLabels;
  final ChartDataLabelAlignment? labelAlignment;
  final double? labelFontSize;
  final Color? labelFontColor;
  final double? borderRadius;
  final Color? axisTitleColor;
  final bool? showLegend;
  final LegendDirection? legendDirection;
  final double? legendFontSize;
  final double? axisFontSize;
  final int? axisRotation;
  final double? tooltipFontSize;
  final Color? tooltipColor;
  final Color? tooltipFontColor;
  final TooltipPosition? tooltipPosition;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  final NumberFormat numberFormatter = NumberFormat.decimalPattern('th');

  bool _hasValidData(double? Function(ColumnChartDataStruct) getter) {
    // Series is considered valid if ANY point is non-null and > 0
    return widget.chartData.any((d) => getter(d) != null && getter(d)! > 0);
  }

  @override
  Widget build(BuildContext context) {
    final List<sf.CartesianSeries<ColumnChartDataStruct, String>> seriesList =
        [];

    // --- Series 1 (always) ---
    seriesList.add(
      sf.ColumnSeries<ColumnChartDataStruct, String>(
        dataSource: widget.chartData,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
        width: widget.columnWidth ?? 0.6,
        xValueMapper: (data, _) => data.xTitle,
        yValueMapper: (data, _) => data.yValue1,
        dataLabelMapper: (data, _) =>
            data.yValue1 != null ? numberFormatter.format(data.yValue1) : '',
        color: widget.chartColors.isNotEmpty
            ? widget.chartColors[0 % widget.chartColors.length]
            : Colors.blue,
        name: widget.seriesNames1 ?? 'Series 1',
        dataLabelSettings: _labelSettings(),
      ),
    );

    // --- Series 2 (only if data exists) ---
    if (_hasValidData((d) => d.yValue2)) {
      seriesList.add(
        sf.ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.xTitle,
          yValueMapper: (data, _) => data.yValue2,
          dataLabelMapper: (data, _) =>
              data.yValue2 != null ? numberFormatter.format(data.yValue2) : '',
          color: widget.chartColors.isNotEmpty
              ? widget.chartColors[1 % widget.chartColors.length]
              : Colors.orange,
          name: widget.seriesNames2 ?? 'Series 2',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 3 (only if data exists) ---
    if (_hasValidData((d) => d.yValue3)) {
      seriesList.add(
        sf.ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.xTitle,
          yValueMapper: (data, _) => data.yValue3,
          dataLabelMapper: (data, _) =>
              data.yValue3 != null ? numberFormatter.format(data.yValue3) : '',
          color: widget.chartColors.isNotEmpty
              ? widget.chartColors[2 % widget.chartColors.length]
              : Colors.orange,
          name: widget.seriesNames3 ?? 'Series 3',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 4 (only if data exists) ---
    if (_hasValidData((d) => d.yValue4)) {
      seriesList.add(
        sf.ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.xTitle,
          yValueMapper: (data, _) => data.yValue4,
          dataLabelMapper: (data, _) =>
              data.yValue4 != null ? numberFormatter.format(data.yValue4) : '',
          color: widget.chartColors.isNotEmpty
              ? widget.chartColors[3 % widget.chartColors.length]
              : Colors.red,
          name: widget.seriesNames4 ?? 'Series 4',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 5 (only if data exists) ---
    if (_hasValidData((d) => d.yValue5)) {
      seriesList.add(
        sf.ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.xTitle,
          yValueMapper: (data, _) => data.yValue5,
          dataLabelMapper: (data, _) =>
              data.yValue5 != null ? numberFormatter.format(data.yValue5) : '',
          color: widget.chartColors.isNotEmpty
              ? widget.chartColors[4 % widget.chartColors.length]
              : Colors.purple,
          name: widget.seriesNames5 ?? 'Series 5',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    return sf.SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: sf.Legend(
        isVisible: widget.showLegend ?? true,
        position: mapLegendDirection(widget.legendDirection),
        overflowMode: sf.LegendItemOverflowMode.wrap,
        textStyle: GoogleFonts.ibmPlexSansThaiLooped(
          color: widget.axisTitleColor ?? Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: widget.legendFontSize ?? 12.0,
        ),
      ),
      primaryXAxis: sf.CategoryAxis(
        majorGridLines: const sf.MajorGridLines(width: 0),
        labelStyle: GoogleFonts.ibmPlexSansThaiLooped(
          color: widget.axisTitleColor ?? Colors.black,
          fontSize: widget.axisFontSize ?? 12.0,
          fontWeight: FontWeight.w500,
        ),
        labelRotation: widget.axisRotation ?? 0,
      ),
      primaryYAxis: sf.NumericAxis(
        labelStyle: GoogleFonts.ibmPlexSansThaiLooped(
          color: widget.axisTitleColor ?? Colors.black,
          fontSize: widget.axisFontSize ?? 12.0,
          fontWeight: FontWeight.w500,
        ),
        minimum: widget.min,
        maximum: widget.max,
        interval: widget.interval,
        numberFormat: numberFormatter,
      ),
      tooltipBehavior: sf.TooltipBehavior(
        enable: true,
        color: widget.tooltipColor ?? Colors.white,
        tooltipPosition: mapTooltipPosition(widget.tooltipPosition),
        textStyle: GoogleFonts.ibmPlexSansThaiLooped(
          color: widget.tooltipFontColor ?? Colors.black,
          fontSize: widget.tooltipFontSize ?? 12,
        ),
      ),
      series: seriesList,
    );
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
        return sf.ChartDataLabelAlignment.auto;
    }
  }

  // Mapping LegendPosition from sf with enum
  sf.LegendPosition mapLegendDirection(Enum? alignment) {
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

  sf.DataLabelSettings _labelSettings() {
    return sf.DataLabelSettings(
      textStyle: GoogleFonts.ibmPlexSansThaiLooped(
        color: widget.labelFontColor ?? Colors.black,
        fontSize: widget.labelFontSize ?? 12.0,
      ),
      isVisible: widget.showLabels ?? true,
      labelAlignment: mapAlignment(widget.labelAlignment),
    );
  }
}
