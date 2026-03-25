import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'int_overview_dashboard_model.dart';
export 'int_overview_dashboard_model.dart';

class IntOverviewDashboardWidget extends StatefulWidget {
  const IntOverviewDashboardWidget({
    super.key,
    this.icon,
    this.label,
    this.value,
    this.width,
    this.height,
    this.iconColor,
    Color? containerColor,
    Color? txtColor,
    this.subTextColor,
  })  : this.containerColor = containerColor ?? Colors.white,
        this.txtColor = txtColor ?? Colors.black;

  final Widget? icon;
  final String? label;
  final int? value;
  final int? width;
  final int? height;
  final Color? iconColor;
  final Color containerColor;
  final Color txtColor;
  final Color? subTextColor;

  @override
  State<IntOverviewDashboardWidget> createState() =>
      _IntOverviewDashboardWidgetState();
}

class _IntOverviewDashboardWidgetState
    extends State<IntOverviewDashboardWidget> {
  late IntOverviewDashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntOverviewDashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget!.width?.toDouble(),
      height: widget!.height?.toDouble(),
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.containerColor,
          FlutterFlowTheme.of(context).primaryBackground,
        ),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget!.icon!,
            Text(
              valueOrDefault<String>(
                formatNumber(
                  widget!.value,
                  formatType: FormatType.decimal,
                  decimalType: DecimalType.periodDecimal,
                ),
                '1234',
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: widget!.txtColor,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget!.label,
                '[label]',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget!.subTextColor,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
