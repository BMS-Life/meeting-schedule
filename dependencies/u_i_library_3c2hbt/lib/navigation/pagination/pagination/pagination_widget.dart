import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagination_model.dart';
export 'pagination_model.dart';

class PaginationWidget extends StatefulWidget {
  const PaginationWidget({
    super.key,
    this.range,
    this.total,
    this.bgColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textSize,
    this.textColor,
    this.nextBtnColor,
    this.pressBack,
    this.pressNext,
  });

  final String? range;
  final int? total;
  final Color? bgColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? textSize;
  final Color? textColor;
  final Color? nextBtnColor;
  final Future Function()? pressBack;
  final Future Function()? pressNext;

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  late PaginationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginationModel());

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
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.bgColor,
          FlutterFlowTheme.of(context).secondaryBackground,
        ),
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          widget!.borderRadius,
          100.0,
        )),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.borderColor,
            FlutterFlowTheme.of(context).alternate,
          ),
          width: valueOrDefault<double>(
            widget!.borderWidth,
            1.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.range,
                    '1 - 20',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: widget!.textColor,
                        fontSize: widget!.textSize,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Text(
                  'จาก',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: widget!.textColor,
                        fontSize: widget!.textSize,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    formatNumber(
                      widget!.total,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.periodDecimal,
                    ),
                    '60',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: widget!.textColor,
                        fontSize: widget!.textSize,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 4.0)),
            ),
            AlignedTooltip(
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Text(
                  'ย้อนกลับ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              offset: 8.0,
              preferredDirection: AxisDirection.down,
              borderRadius: BorderRadius.circular(8.0),
              backgroundColor: Color(0xCB3B3B3B),
              elevation: 0.0,
              tailBaseWidth: 0.0,
              tailLength: 0.0,
              waitDuration: Duration(milliseconds: 100),
              showDuration: Duration(milliseconds: 100),
              triggerMode: TooltipTriggerMode.tap,
              child: FlutterFlowIconButton(
                borderRadius: 100.0,
                buttonSize: 32.0,
                icon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 16.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
            AlignedTooltip(
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                child: Text(
                  'ถัดไป',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              offset: 8.0,
              preferredDirection: AxisDirection.down,
              borderRadius: BorderRadius.circular(8.0),
              backgroundColor: Color(0xCB3B3B3B),
              elevation: 0.0,
              tailBaseWidth: 0.0,
              tailLength: 0.0,
              waitDuration: Duration(milliseconds: 100),
              showDuration: Duration(milliseconds: 100),
              triggerMode: TooltipTriggerMode.tap,
              child: FlutterFlowIconButton(
                borderRadius: 100.0,
                buttonSize: 32.0,
                fillColor: valueOrDefault<Color>(
                  widget!.nextBtnColor,
                  Color(0xFF00598A),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 16.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
