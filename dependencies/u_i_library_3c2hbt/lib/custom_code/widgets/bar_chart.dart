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
import 'package:intl/intl.dart';

class BarChart extends StatefulWidget {
  const BarChart({
    super.key,
    // Dimensions
    this.width,
    this.height,
    // Chart Data
    required this.chartData,
    required this.chartColor,
    // Series Names
    this.seriesNames1,
    this.seriesNames2,
    this.seriesNames3,
    this.seriesNames4,
    this.seriesNames5,
    this.seriesNames6,
    this.seriesNames7,
    this.seriesNames8,
    this.seriesNames9,
    this.seriesNames10,
    // Bar Styling
    this.borderRadius,
    this.columnWidth,
    // Axis Settings
    this.axisTextColor,
    this.axisTextSize,
    this.min,
    this.max,
    this.interval,
    // Legend Settings
    this.showLegend,
    this.legendPosition,
    this.legendTextColor,
    this.legendTextSize,
    // Label Settings
    this.showLabel,
    this.labelAlignment,
    this.labelTextColor,
    this.labelTextSize,
    // Tooltip Settings
    this.tooltipBG,
    this.tooltipTextColor,
    this.tooltipTextSize,
    this.tooltipPosition,
  });

  // Dimensions
  final double? width;
  final double? height;

  // Chart Data
  final List<BarChartDataStruct> chartData;
  final List<Color> chartColor;

  // Series Names
  final String? seriesNames1;
  final String? seriesNames2;
  final String? seriesNames3;
  final String? seriesNames4;
  final String? seriesNames5;
  final String? seriesNames6;
  final String? seriesNames7;
  final String? seriesNames8;
  final String? seriesNames9;
  final String? seriesNames10;

  // Bar Styling
  final double? borderRadius;
  final double? columnWidth;

  // Axis Settings
  final Color? axisTextColor;
  final double? axisTextSize;
  final double? min;
  final double? max;
  final double? interval;

  // Legend Settings
  final bool? showLegend;
  final LegendDirection? legendPosition;
  final Color? legendTextColor;
  final double? legendTextSize;

  // Label Settings
  final bool? showLabel;
  final ChartDataLabelAlignment? labelAlignment;
  final Color? labelTextColor;
  final double? labelTextSize;

  // Tooltip Settings
  final Color? tooltipBG;
  final Color? tooltipTextColor;
  final double? tooltipTextSize;
  final TooltipPosition? tooltipPosition;

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late sf.TooltipBehavior _tooltipBehavior;
  late NumberFormat _numberFormat;

  @override
  void initState() {
    super.initState();
    _numberFormat = NumberFormat('#,###');

    _tooltipBehavior = sf.TooltipBehavior(
      enable: true,
      format: 'point.x : point.y',
      color: widget.tooltipBG ?? const Color(0xFF424242),
      tooltipPosition: mapTooltipPosition(widget.tooltipPosition),
      textStyle: TextStyle(
        color: widget.tooltipTextColor ?? Colors.white,
        fontSize: widget.tooltipTextSize ?? 12,
        fontFamily: 'IBM Plex Sans Thai Looped',
      ),
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

  // Helper method to check if a series has valid data
  bool _hasValidData(double? Function(BarChartDataStruct) getter) {
    return widget.chartData.any((d) {
      final value = getter(d);
      return value != null && value != 0;
    });
  }

  // Helper: convert dynamic/num/int to double? safely
  static double? _toDoubleNullable(dynamic v) {
    if (v == null) return null;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is num) return v.toDouble();
    if (v is String) {
      final parsed = double.tryParse(v.replaceAll(',', ''));
      return parsed;
    }
    return null;
  }

  // Data label settings
  sf.DataLabelSettings _labelSettings() {
    return sf.DataLabelSettings(
      isVisible: widget.showLabel ?? true,
      labelAlignment: mapAlignment(widget.labelAlignment),
      textStyle: TextStyle(
        color: widget.labelTextColor ?? Colors.white,
        fontSize: widget.labelTextSize ?? 12,
        fontFamily: 'IBM Plex Sans Thai Looped',
      ),
    );
  }

  // Fallback color generator for indices without a provided color
  Color _defaultColorForIndex(int index) {
    const fallbackPalette = [
      Color(0xFF0069A8),
      Color(0xFF00A6F4),
      Color(0xFFFFB300),
      Color(0xFFD32F2F),
      Color(0xFF7B1FA2),
      Color(0xFF43A047),
      Color(0xFFFB8C00),
      Color(0xFF8E24AA),
      Color(0xFF1976D2),
      Color(0xFF26A69A),
    ];
    return fallbackPalette[index % fallbackPalette.length];
  }

  List<sf.CartesianSeries<dynamic, dynamic>> _buildSeriesList() {
    final List<sf.CartesianSeries<dynamic, dynamic>> seriesList = [];

    // --- Series 1 (always) ---
    seriesList.add(
      sf.BarSeries<BarChartDataStruct, String>(
        dataSource: widget.chartData,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
        width: widget.columnWidth ?? 0.6,
        xValueMapper: (data, _) => data.label,
        yValueMapper: (data, _) => _toDoubleNullable(data.yValues1),
        dataLabelMapper: (data, _) => data.yValues1 != null
            ? _numberFormat.format(_toDoubleNullable(data.yValues1))
            : '',
        color: widget.chartColor.isNotEmpty
            ? widget.chartColor[0 % widget.chartColor.length]
            : _defaultColorForIndex(0),
        name: widget.seriesNames1 ?? 'Series 1',
        dataLabelSettings: _labelSettings(),
      ),
    );

    // --- Series 2 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues2))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues2),
          dataLabelMapper: (data, _) => data.yValues2 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues2))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[1 % widget.chartColor.length]
              : _defaultColorForIndex(1),
          name: widget.seriesNames2 ?? 'Series 2',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 3 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues3))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues3),
          dataLabelMapper: (data, _) => data.yValues3 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues3))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[2 % widget.chartColor.length]
              : _defaultColorForIndex(2),
          name: widget.seriesNames3 ?? 'Series 3',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 4 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues4))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues4),
          dataLabelMapper: (data, _) => data.yValues4 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues4))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[3 % widget.chartColor.length]
              : _defaultColorForIndex(3),
          name: widget.seriesNames4 ?? 'Series 4',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 5 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues5))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues5),
          dataLabelMapper: (data, _) => data.yValues5 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues5))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[4 % widget.chartColor.length]
              : _defaultColorForIndex(4),
          name: widget.seriesNames5 ?? 'Series 5',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 6 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues6))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues6),
          dataLabelMapper: (data, _) => data.yValues6 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues6))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[5 % widget.chartColor.length]
              : _defaultColorForIndex(5),
          name: widget.seriesNames6 ?? 'Series 6',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 7 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues7))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues7),
          dataLabelMapper: (data, _) => data.yValues7 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues7))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[6 % widget.chartColor.length]
              : _defaultColorForIndex(6),
          name: widget.seriesNames7 ?? 'Series 7',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 8 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues8))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues8),
          dataLabelMapper: (data, _) => data.yValues8 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues8))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[7 % widget.chartColor.length]
              : _defaultColorForIndex(7),
          name: widget.seriesNames8 ?? 'Series 8',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 9 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues9))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues9),
          dataLabelMapper: (data, _) => data.yValues9 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues9))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[8 % widget.chartColor.length]
              : _defaultColorForIndex(8),
          name: widget.seriesNames9 ?? 'Series 9',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    // --- Series 10 (only if data exists) ---
    if (_hasValidData((d) => _toDoubleNullable(d.yValues10))) {
      seriesList.add(
        sf.BarSeries<BarChartDataStruct, String>(
          dataSource: widget.chartData,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          width: widget.columnWidth ?? 0.6,
          xValueMapper: (data, _) => data.label,
          yValueMapper: (data, _) => _toDoubleNullable(data.yValues10),
          dataLabelMapper: (data, _) => data.yValues10 != null
              ? _numberFormat.format(_toDoubleNullable(data.yValues10))
              : '',
          color: widget.chartColor.isNotEmpty
              ? widget.chartColor[9 % widget.chartColor.length]
              : _defaultColorForIndex(9),
          name: widget.seriesNames10 ?? 'Series 10',
          dataLabelSettings: _labelSettings(),
        ),
      );
    }

    return seriesList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: sf.SfCartesianChart(
        backgroundColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        tooltipBehavior: _tooltipBehavior,
        legend: sf.Legend(
          isVisible: widget.showLegend ?? true,
          position: mapLegendDirection(widget.legendPosition),
          textStyle: TextStyle(
            color: widget.legendTextColor ?? Colors.white,
            fontFamily: 'IBM Plex Sans Thai Looped',
            fontSize: widget.legendTextSize ?? 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        primaryXAxis: sf.CategoryAxis(
          labelStyle: TextStyle(
            color: widget.axisTextColor ?? Colors.white,
            fontFamily: 'IBM Plex Sans Thai Looped',
            fontSize: widget.axisTextSize ?? 14,
            fontWeight: FontWeight.w600,
          ),
          majorGridLines: const sf.MajorGridLines(width: 0),
          labelPlacement: sf.LabelPlacement.betweenTicks,
          labelIntersectAction: sf.AxisLabelIntersectAction.wrap,
        ),
        primaryYAxis: sf.NumericAxis(
          labelStyle: TextStyle(
            color: widget.axisTextColor ?? Colors.white,
            fontFamily: 'IBM Plex Sans Thai Looped',
            fontSize: widget.axisTextSize ?? 14,
            fontWeight: FontWeight.w600,
          ),
          majorGridLines: const sf.MajorGridLines(width: 1),
          minimum: widget.min,
          maximum: widget.max,
          interval: widget.interval,
          numberFormat: _numberFormat,
        ),
        series: _buildSeriesList(),
      ),
    );
  }
}
