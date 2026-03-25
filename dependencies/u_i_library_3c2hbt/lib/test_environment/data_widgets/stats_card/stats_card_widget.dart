import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stats_card_model.dart';
export 'stats_card_model.dart';

class StatsCardWidget extends StatefulWidget {
  const StatsCardWidget({
    super.key,
    this.title,
    this.hasShadow,
    this.borderWidth,
    this.dataValue,
    int? leftMargin,
    int? topMargin,
    int? rightMargin,
    int? bottomMargin,
    Color? titleColor,
    this.columnPadding,
    int? borderRadius,
    this.dataValueColor,
    this.imageURL,
    Color? shadowColor,
    this.shadowBlur,
    this.gradientDirection,
    this.gradientColor1,
    this.gradientColor2,
    double? imageWidth,
    double? imageHeight,
    double? rowPadding,
    String? valueUnit,
    double? valueTextSize,
    this.titleSize,
    this.unitSize,
  })  : this.leftMargin = leftMargin ?? 8,
        this.topMargin = topMargin ?? 8,
        this.rightMargin = rightMargin ?? 8,
        this.bottomMargin = bottomMargin ?? 8,
        this.titleColor = titleColor ?? const Color(0xFF57636C),
        this.borderRadius = borderRadius ?? 24,
        this.shadowColor = shadowColor ?? const Color(0x1E666666),
        this.imageWidth = imageWidth ?? 64.0,
        this.imageHeight = imageHeight ?? 64.0,
        this.rowPadding = rowPadding ?? 0.0,
        this.valueUnit = valueUnit ?? 'หน่วย',
        this.valueTextSize = valueTextSize ?? 20.0;

  final String? title;
  final bool? hasShadow;
  final int? borderWidth;
  final String? dataValue;
  final int leftMargin;
  final int topMargin;
  final int rightMargin;
  final int bottomMargin;
  final Color titleColor;
  final int? columnPadding;
  final int borderRadius;
  final Color? dataValueColor;
  final String? imageURL;
  final Color shadowColor;
  final double? shadowBlur;
  final double? gradientDirection;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final double imageWidth;
  final double imageHeight;
  final double rowPadding;
  final String valueUnit;
  final double valueTextSize;
  final double? titleSize;
  final double? unitSize;

  @override
  State<StatsCardWidget> createState() => _StatsCardWidgetState();
}

class _StatsCardWidgetState extends State<StatsCardWidget>
    with TickerProviderStateMixin {
  late StatsCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatsCardModel());

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -6.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: widget!.shadowBlur!,
              color: valueOrDefault<Color>(
                widget!.hasShadow == true
                    ? valueOrDefault<Color>(
                        widget!.shadowColor,
                        Color(0x1F666666),
                      )
                    : Colors.transparent,
                Colors.transparent,
              ),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          gradient: LinearGradient(
            colors: [
              valueOrDefault<Color>(
                widget!.gradientColor1,
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
              valueOrDefault<Color>(
                widget!.gradientColor2,
                Color(0xFFFFEBEE),
              )
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(
                computeGradientAlignmentX(valueOrDefault<double>(
                  widget!.gradientDirection,
                  0.0,
                )),
                computeGradientAlignmentY(valueOrDefault<double>(
                  widget!.gradientDirection,
                  0.0,
                ))),
            end: AlignmentDirectional(
                -1 *
                    computeGradientAlignmentX(valueOrDefault<double>(
                      widget!.gradientDirection,
                      0.0,
                    )),
                -1 *
                    computeGradientAlignmentY(valueOrDefault<double>(
                      widget!.gradientDirection,
                      0.0,
                    ))),
          ),
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget!.borderRadius.toDouble(),
            24.0,
          )),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: widget!.borderWidth!.toDouble(),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                widget!.leftMargin.toDouble(),
                0.0,
              ),
              valueOrDefault<double>(
                widget!.topMargin.toDouble(),
                0.0,
              ),
              valueOrDefault<double>(
                widget!.rightMargin.toDouble(),
                0.0,
              ),
              valueOrDefault<double>(
                widget!.bottomMargin.toDouble(),
                0.0,
              )),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.title,
                      '{title}',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            widget!.titleColor,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          fontSize: widget!.titleSize,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.dataValue,
                          'dataValue',
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: widget!.dataValueColor,
                              fontSize: widget!.valueTextSize,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.valueUnit,
                          'หน่วย',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.ibmPlexSansThaiLooped(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: valueOrDefault<Color>(
                                widget!.titleColor,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              fontSize: widget!.unitSize,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(
                    height: valueOrDefault<double>(
                  widget!.columnPadding?.toDouble(),
                  0.0,
                ))),
              ),
              Image.network(
                valueOrDefault<String>(
                  widget!.imageURL,
                  'https://pnvelvwsvlokgdrbznip.supabase.co/storage/v1/object/public/images/assets/hospital.png',
                ),
                width: widget!.imageWidth,
                height: widget!.imageHeight,
                fit: BoxFit.cover,
              ).animateOnActionTrigger(
                animationsMap['imageOnActionTriggerAnimation']!,
              ),
            ].divide(SizedBox(width: widget!.rowPadding)),
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        if (animationsMap['imageOnActionTriggerAnimation'] != null) {
          await animationsMap['imageOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        if (animationsMap['imageOnActionTriggerAnimation'] != null) {
          await animationsMap['imageOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
      }),
    );
  }
}
