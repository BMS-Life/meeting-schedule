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

class BarStackedChart extends StatefulWidget {
  const BarStackedChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.chartColor,
    this.seriesName1,
    this.seriesName2,
    this.seriesName3,
    this.seriesName4,
    this.seriesName5,
    this.min,
    this.max,
    this.interval,
    this.showLabels = true,
    this.labelAlignment,
    this.labelFontSize = 12.0,
    this.labelFontColor = Colors.black,
    this.axisFontSize = 12.0,
    this.axisRotation,
    this.axisTitleColor = Colors.black,
    this.showLegend = true,
    this.legendDirection,
    this.legendFontSize = 12.0,
    this.tooltipColor,
    this.tooltipTextColor,
    this.tooltipTextSize,
    this.tooltipPosition,
    this.barWidth = 0.8,
    this.barSpacing = 0.1,
    this.barBorderRadius = 4.0,
  });

  final double? width;
  final double? height;
  final List<BarStackedChartStruct> chartData;
  final List<Color> chartColor;
  final String? seriesName1;
  final String? seriesName2;
  final String? seriesName3;
  final String? seriesName4;
  final String? seriesName5;
  final double? min;
  final double? max;
  final double? interval;

  // extra
  final bool? showLabels;
  final ChartDataLabelAlignment? labelAlignment;
  final double? labelFontSize;
  final Color? labelFontColor;
  final Color? axisTitleColor;
  final bool? showLegend;
  final LegendDirection? legendDirection;
  final double? legendFontSize;
  final double? axisFontSize;
  final int? axisRotation;
  final Color? tooltipColor;
  final Color? tooltipTextColor;
  final double? tooltipTextSize;
  final TooltipPosition? tooltipPosition;

  // new
  final double? barWidth;
  final double? barSpacing;
  final double? barBorderRadius;

  @override
  State<BarStackedChart> createState() => _BarStackedChartState();
}

class _BarStackedChartState extends State<BarStackedChart> {
  late sf.TooltipBehavior _tooltipBehavior;
  final NumberFormat numberFormatter = NumberFormat('#,###');

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = sf.TooltipBehavior(
      enable: true,
      header: '',
      canShowMarker: false,
      color: widget.tooltipColor ?? Colors.black87,
      tooltipPosition: mapTooltipPosition(widget.tooltipPosition),
      textStyle: GoogleFonts.ibmPlexSansThaiLooped(
        color: widget.tooltipTextColor ?? Colors.white,
        fontSize: widget.tooltipTextSize ?? 12.0,
      ),
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        final BarStackedChartStruct chartData = data as BarStackedChartStruct;
        final seriesName = series.name ?? 'Series ${seriesIndex + 1}';

        // Get the correct y value based on series index
        double? yValue;
        switch (seriesIndex) {
          case 0:
            yValue = chartData.yValue1?.toDouble();
            break;
          case 1:
            yValue = chartData.yValue2?.toDouble();
            break;
          case 2:
            yValue = chartData.yValue3?.toDouble();
            break;
          case 3:
            yValue = chartData.yValue4?.toDouble();
            break;
          case 4:
            yValue = chartData.yValue5?.toDouble();
            break;
        }

        final formattedValue =
            yValue != null ? numberFormatter.format(yValue) : '0';

        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: widget.tooltipColor ?? Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '$seriesName: $formattedValue',
            style: GoogleFonts.ibmPlexSansThaiLooped(
              color: widget.tooltipTextColor ?? Colors.white,
              fontSize: widget.tooltipTextSize ?? 12.0,
            ),
          ),
        );
      },
    );
  }

  Color? _getSeriesColor(int index) {
    if (widget.chartColor.isNotEmpty && widget.chartColor.length > index) {
      return widget.chartColor[index];
    }
    return null;
  }

  sf.StackedBarSeries<BarStackedChartStruct, String> _buildSeries({
    required int index,
    required double? Function(BarStackedChartStruct, int) yMapper,
    required String name,
    Color? color,
    String? Function(BarStackedChartStruct, int)? dataLabelMapper,
  }) {
    return sf.StackedBarSeries<BarStackedChartStruct, String>(
      dataSource: widget.chartData,
      xValueMapper: (d, _) => d.xTitle,
      yValueMapper: yMapper,
      dataLabelMapper: dataLabelMapper,
      name: name,
      color: color,
      width: widget.barWidth ?? 0.8,
      spacing: widget.barSpacing ?? 0.1,
      borderRadius: BorderRadius.all(
        Radius.circular(widget.barBorderRadius ?? 4.0),
      ),
      dataLabelSettings: _labelSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final seriesList = <sf.StackedBarSeries<BarStackedChartStruct, String>>[];

    // ✅ Series 1: always included
    seriesList.add(_buildSeries(
      index: 0,
      yMapper: (d, _) => d.yValue1?.toDouble(),
      dataLabelMapper: (d, _) =>
          d.yValue1 != null ? numberFormatter.format(d.yValue1) : '',
      name: widget.seriesName1 ?? 'Series 1',
      color: _getSeriesColor(0),
    ));

    // ✅ Series 2–5: add only if name is provided
    if (widget.seriesName2 != null && widget.seriesName2!.isNotEmpty) {
      seriesList.add(_buildSeries(
        index: 1,
        yMapper: (d, _) => d.yValue2?.toDouble(),
        dataLabelMapper: (d, _) =>
            d.yValue2 != null ? numberFormatter.format(d.yValue2) : '',
        name: widget.seriesName2!,
        color: _getSeriesColor(1),
      ));
    }

    if (widget.seriesName3 != null && widget.seriesName3!.isNotEmpty) {
      seriesList.add(_buildSeries(
        index: 2,
        yMapper: (d, _) => d.yValue3?.toDouble(),
        dataLabelMapper: (d, _) =>
            d.yValue3 != null ? numberFormatter.format(d.yValue3) : '',
        name: widget.seriesName3!,
        color: _getSeriesColor(2),
      ));
    }

    if (widget.seriesName4 != null && widget.seriesName4!.isNotEmpty) {
      seriesList.add(_buildSeries(
        index: 3,
        yMapper: (d, _) => d.yValue4?.toDouble(),
        dataLabelMapper: (d, _) =>
            d.yValue4 != null ? numberFormatter.format(d.yValue4) : '',
        name: widget.seriesName4!,
        color: _getSeriesColor(3),
      ));
    }

    if (widget.seriesName5 != null && widget.seriesName5!.isNotEmpty) {
      seriesList.add(_buildSeries(
        index: 4,
        yMapper: (d, _) => d.yValue5?.toDouble(),
        dataLabelMapper: (d, _) =>
            d.yValue5 != null ? numberFormatter.format(d.yValue5) : '',
        name: widget.seriesName5!,
        color: _getSeriesColor(4),
      ));
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: sf.SfCartesianChart(
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
          axisLine: const sf.AxisLine(width: 0),
          labelFormat: '{value}',
          labelStyle: GoogleFonts.ibmPlexSansThaiLooped(
            color: widget.axisTitleColor ?? Colors.black,
            fontSize: widget.axisFontSize ?? 12.0,
            fontWeight: FontWeight.w500,
          ),
          majorTickLines: const sf.MajorTickLines(size: 0),
          minimum: widget.min ?? 0,
          maximum: widget.max ?? 100,
          interval: widget.interval ?? 20,
          numberFormat: numberFormatter,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: seriesList,
      ),
    );
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
}
