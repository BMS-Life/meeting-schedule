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
import 'dialog_icon_model.dart';
export 'dialog_icon_model.dart';

class DialogIconWidget extends StatefulWidget {
  const DialogIconWidget({
    super.key,
    required this.illustraion,
    String? title,
    String? description,
    double? dialogBorderRadius,
    double? margin,
    double? titleSize,
    Color? titleColor,
    double? descriptionSize,
    Color? descriptionColor,
    Color? leftBtnColor,
    String? leftBtnText,
    Color? leftBtnTextColor,
    double? leftBtnTextSize,
    double? leftBtnBorder,
    Color? leftBtnBorderColor,
    this.leftBtnAction,
    Color? rightBtnColor,
    String? rightBtnText,
    Color? rightBtnTextColor,
    double? rightBtnTextSize,
    this.rightBtnBorder,
    this.rightBtnBorderColor,
    this.rightBtnAction,
    double? buttonRounded,
    double? dialogWidth,
    this.showDescription,
    this.hideRightButton,
  })  : this.title = title ?? '[title]',
        this.description = description ?? 'description',
        this.dialogBorderRadius = dialogBorderRadius ?? 24.0,
        this.margin = margin ?? 24.0,
        this.titleSize = titleSize ?? 20.0,
        this.titleColor = titleColor ?? const Color(0xFF111111),
        this.descriptionSize = descriptionSize ?? 4.0,
        this.descriptionColor = descriptionColor ?? const Color(0xFF292929),
        this.leftBtnColor = leftBtnColor ?? Colors.white,
        this.leftBtnText = leftBtnText ?? 'Lorem',
        this.leftBtnTextColor = leftBtnTextColor ?? Colors.black,
        this.leftBtnTextSize = leftBtnTextSize ?? 16.0,
        this.leftBtnBorder = leftBtnBorder ?? 16.0,
        this.leftBtnBorderColor = leftBtnBorderColor ?? const Color(0xFFEEEEEE),
        this.rightBtnColor = rightBtnColor ?? Colors.black,
        this.rightBtnText = rightBtnText ?? 'Lorem',
        this.rightBtnTextColor = rightBtnTextColor ?? Colors.white,
        this.rightBtnTextSize = rightBtnTextSize ?? 16.0,
        this.buttonRounded = buttonRounded ?? 16.0,
        this.dialogWidth = dialogWidth ?? 400.0;

  final Widget? illustraion;
  final String title;
  final String description;
  final double dialogBorderRadius;
  final double margin;
  final double titleSize;
  final Color titleColor;
  final double descriptionSize;
  final Color descriptionColor;
  final Color leftBtnColor;
  final String leftBtnText;
  final Color leftBtnTextColor;
  final double leftBtnTextSize;
  final double leftBtnBorder;
  final Color leftBtnBorderColor;
  final Future Function()? leftBtnAction;
  final Color rightBtnColor;
  final String rightBtnText;
  final Color rightBtnTextColor;
  final double rightBtnTextSize;
  final double? rightBtnBorder;
  final Color? rightBtnBorderColor;
  final Future Function()? rightBtnAction;
  final double buttonRounded;
  final double dialogWidth;
  final bool? showDescription;
  final bool? hideRightButton;

  @override
  State<DialogIconWidget> createState() => _DialogIconWidgetState();
}

class _DialogIconWidgetState extends State<DialogIconWidget>
    with TickerProviderStateMixin {
  late DialogIconModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogIconModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
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
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
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
            begin: Offset(0.0, 20.0),
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
    return Container(
      width: valueOrDefault<double>(
        widget!.dialogWidth,
        400.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          widget!.dialogBorderRadius,
          24.0,
        )),
      ),
      child: Padding(
        padding: EdgeInsets.all(valueOrDefault<double>(
          widget!.margin,
          24.0,
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget!.illustraion!,
                Text(
                  valueOrDefault<String>(
                    widget!.title,
                    '[title]',
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.ibmPlexSansThaiLooped(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget!.titleColor,
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                        fontSize: valueOrDefault<double>(
                          widget!.titleSize,
                          20.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                if (widget!.showDescription ?? true)
                  Text(
                    valueOrDefault<String>(
                      widget!.description,
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            widget!.descriptionColor,
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          fontSize: valueOrDefault<double>(
                            widget!.descriptionSize,
                            14.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation2']!),
              ].divide(SizedBox(height: 8.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.leftBtnAction?.call();
                    },
                    text: valueOrDefault<String>(
                      widget!.leftBtnText,
                      'Lorem',
                    ),
                    options: FFButtonOptions(
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: valueOrDefault<Color>(
                        widget!.leftBtnColor,
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: widget!.leftBtnTextColor,
                                fontSize: widget!.leftBtnTextSize,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: valueOrDefault<Color>(
                          widget!.leftBtnBorderColor,
                          FlutterFlowTheme.of(context).alternate,
                        ),
                        width: valueOrDefault<double>(
                          widget!.leftBtnBorder,
                          1.0,
                        ),
                      ),
                      borderRadius:
                          BorderRadius.circular(valueOrDefault<double>(
                        widget!.buttonRounded,
                        16.0,
                      )),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation1']!),
                ),
                if (!widget!.hideRightButton!)
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        await widget.rightBtnAction?.call();
                      },
                      text: valueOrDefault<String>(
                        widget!.rightBtnText,
                        'Lorem',
                      ),
                      options: FFButtonOptions(
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: widget!.rightBtnColor,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    widget!.rightBtnTextColor,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  fontSize: widget!.rightBtnTextSize,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius:
                            BorderRadius.circular(valueOrDefault<double>(
                          widget!.buttonRounded,
                          16.0,
                        )),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation2']!),
                  ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
