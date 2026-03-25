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
import 'numeric_data_widget_basic_model.dart';
export 'numeric_data_widget_basic_model.dart';

class NumericDataWidgetBasicWidget extends StatefulWidget {
  const NumericDataWidgetBasicWidget({
    super.key,
    String? title,
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
    Color? shadowColor,
    this.shadowBlur,
    Color? widgetColor,
    this.cardImage,
    this.imageWidth,
    this.imageHeight,
    double? titleSize,
    double? valueSize,
  })  : this.title = title ?? '',
        this.leftMargin = leftMargin ?? 8,
        this.topMargin = topMargin ?? 8,
        this.rightMargin = rightMargin ?? 8,
        this.bottomMargin = bottomMargin ?? 8,
        this.titleColor = titleColor ?? const Color(0xFF57636C),
        this.borderRadius = borderRadius ?? 24,
        this.shadowColor = shadowColor ?? const Color(0x1E666666),
        this.widgetColor = widgetColor ?? Colors.white,
        this.titleSize = titleSize ?? 16.0,
        this.valueSize = valueSize ?? 24.0;

  final String title;
  final bool? hasShadow;
  final int? borderWidth;
  final int? dataValue;
  final int leftMargin;
  final int topMargin;
  final int rightMargin;
  final int bottomMargin;
  final Color titleColor;
  final int? columnPadding;
  final int borderRadius;
  final Color? dataValueColor;
  final Color shadowColor;
  final double? shadowBlur;
  final Color widgetColor;
  final Widget Function()? cardImage;
  final double? imageWidth;
  final double? imageHeight;
  final double titleSize;
  final double valueSize;

  @override
  State<NumericDataWidgetBasicWidget> createState() =>
      _NumericDataWidgetBasicWidgetState();
}

class _NumericDataWidgetBasicWidgetState
    extends State<NumericDataWidgetBasicWidget> with TickerProviderStateMixin {
  late NumericDataWidgetBasicModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumericDataWidgetBasicModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
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
          color: valueOrDefault<Color>(
            widget!.widgetColor,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
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
                16.0,
              ),
              valueOrDefault<double>(
                widget!.topMargin.toDouble(),
                8.0,
              ),
              valueOrDefault<double>(
                widget!.rightMargin.toDouble(),
                16.0,
              ),
              valueOrDefault<double>(
                widget!.bottomMargin.toDouble(),
                8.0,
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
                          fontSize: valueOrDefault<double>(
                            widget!.titleSize,
                            12.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      formatNumber(
                        widget!.dataValue,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.periodDecimal,
                      ),
                      '{1,234}',
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: widget!.dataValueColor,
                          fontSize: widget!.valueSize,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ].divide(SizedBox(
                    height: valueOrDefault<double>(
                  widget!.columnPadding?.toDouble(),
                  0.0,
                ))),
              ),
              Container(
                width: valueOrDefault<double>(
                  widget!.imageWidth,
                  84.0,
                ),
                height: valueOrDefault<double>(
                  widget!.imageHeight,
                  84.0,
                ),
                decoration: BoxDecoration(),
                child: Builder(builder: (_) {
                  return widget.cardImage != null
                      ? widget.cardImage!()
                      : SizedBox.shrink();
                }).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation']!,
                ),
              ),
            ],
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
      }),
    );
  }
}
