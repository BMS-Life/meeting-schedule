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
import 'stacked_card_model.dart';
export 'stacked_card_model.dart';

class StackedCardWidget extends StatefulWidget {
  const StackedCardWidget({
    super.key,
    this.titleText,
    this.titleSize,
    this.titleColor,
    this.desText,
    this.desSize,
    this.desColor,
    bool? desHide,
    this.underCardWidth,
    this.underCardHeight,
    this.underCardRadius,
    this.underCardMargin,
    this.underCardBorder,
    this.underCardGradientAngle,
    this.underCardPrimaryColor,
    this.underCardSecondaryColor,
    this.primaryColorPoint,
    this.secondaryColorPoint,
    this.illustration,
    this.illustrationWidth,
    this.illustrationHeight,
    this.content,
    this.paddingBetween,
    this.underCardBorderColor,
  }) : this.desHide = desHide ?? false;

  final String? titleText;
  final double? titleSize;
  final Color? titleColor;
  final String? desText;
  final double? desSize;
  final Color? desColor;
  final bool desHide;
  final double? underCardWidth;
  final double? underCardHeight;
  final double? underCardRadius;
  final double? underCardMargin;
  final double? underCardBorder;
  final double? underCardGradientAngle;
  final Color? underCardPrimaryColor;
  final Color? underCardSecondaryColor;
  final double? primaryColorPoint;
  final double? secondaryColorPoint;
  final Widget Function()? illustration;
  final double? illustrationWidth;
  final double? illustrationHeight;
  final Widget Function()? content;
  final double? paddingBetween;
  final Color? underCardBorderColor;

  @override
  State<StackedCardWidget> createState() => _StackedCardWidgetState();
}

class _StackedCardWidgetState extends State<StackedCardWidget>
    with TickerProviderStateMixin {
  late StackedCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StackedCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(valueOrDefault<double>(
        widget!.underCardRadius,
        8.0,
      )),
      child: Container(
        width: valueOrDefault<double>(
          widget!.underCardWidth,
          400.0,
        ),
        height: widget!.underCardHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              valueOrDefault<Color>(
                widget!.underCardPrimaryColor,
                FlutterFlowTheme.of(context).alternate,
              ),
              valueOrDefault<Color>(
                widget!.underCardSecondaryColor,
                FlutterFlowTheme.of(context).alternate,
              )
            ],
            stops: [
              valueOrDefault<double>(
                widget!.primaryColorPoint,
                0.0,
              ),
              valueOrDefault<double>(
                widget!.secondaryColorPoint,
                0.0,
              )
            ],
            begin: AlignmentDirectional(
                computeGradientAlignmentX(valueOrDefault<double>(
                  widget!.underCardGradientAngle,
                  0.0,
                )),
                computeGradientAlignmentY(valueOrDefault<double>(
                  widget!.underCardGradientAngle,
                  0.0,
                ))),
            end: AlignmentDirectional(
                -1 *
                    computeGradientAlignmentX(valueOrDefault<double>(
                      widget!.underCardGradientAngle,
                      0.0,
                    )),
                -1 *
                    computeGradientAlignmentY(valueOrDefault<double>(
                      widget!.underCardGradientAngle,
                      0.0,
                    ))),
          ),
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget!.underCardRadius,
            8.0,
          )),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget!.underCardBorderColor,
              Colors.transparent,
            ),
            width: widget!.underCardBorder!,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional(1.0, 0.0),
              children: [
                Padding(
                  padding: EdgeInsets.all(valueOrDefault<double>(
                    widget!.underCardMargin,
                    8.0,
                  )),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget!.titleText,
                              'titleText',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    widget!.titleColor,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  fontSize: valueOrDefault<double>(
                                    widget!.titleSize,
                                    16.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          if (widget!.desHide)
                            Text(
                              valueOrDefault<String>(
                                widget!.desText,
                                'desText',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.ibmPlexSansThaiLooped(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: valueOrDefault<Color>(
                                      widget!.desColor,
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    fontSize: valueOrDefault<double>(
                                      widget!.desSize,
                                      14.0,
                                    ),
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        widget!.underCardMargin,
                        0.0,
                      ),
                      0.0),
                  child: Container(
                    width: valueOrDefault<double>(
                      widget!.illustrationWidth,
                      40.0,
                    ),
                    height: valueOrDefault<double>(
                      widget!.illustrationHeight,
                      40.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Builder(builder: (_) {
                      return widget.illustration != null
                          ? widget.illustration!()
                          : SizedBox.shrink();
                    }),
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
            ClipRRect(
              borderRadius: BorderRadius.circular(valueOrDefault<double>(
                widget!.underCardRadius,
                8.0,
              )),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget!.underCardRadius,
                    8.0,
                  )),
                ),
                child: Builder(builder: (_) {
                  return widget.content != null
                      ? widget.content!()
                      : SizedBox.shrink();
                }),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
          ].divide(SizedBox(
              height: valueOrDefault<double>(
            widget!.paddingBetween,
            8.0,
          ))),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
  }
}
