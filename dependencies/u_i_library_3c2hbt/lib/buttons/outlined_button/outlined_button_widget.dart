import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'outlined_button_model.dart';
export 'outlined_button_model.dart';

class OutlinedButtonWidget extends StatefulWidget {
  const OutlinedButtonWidget({
    super.key,
    this.text,
    this.textColor,
    this.textSize,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonRadius,
    this.buttonBorderWidth,
    this.buttonBorderColor,
    this.buttonColor,
  });

  final String? text;
  final Color? textColor;
  final double? textSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? buttonRadius;
  final double? buttonBorderWidth;
  final Color? buttonBorderColor;
  final Color? buttonColor;

  @override
  State<OutlinedButtonWidget> createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget>
    with TickerProviderStateMixin {
  late OutlinedButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OutlinedButtonModel());

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
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
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: valueOrDefault<String>(
        widget!.text,
        'Label',
      ),
      options: FFButtonOptions(
        width: widget!.buttonWidth,
        height: valueOrDefault<double>(
          widget!.buttonHeight,
          56.0,
        ),
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: valueOrDefault<Color>(
          widget!.buttonColor,
          FlutterFlowTheme.of(context).secondaryBackground,
        ),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: valueOrDefault<Color>(
                widget!.textColor,
                FlutterFlowTheme.of(context).primaryText,
              ),
              fontSize: widget!.textSize,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: valueOrDefault<Color>(
            widget!.buttonBorderColor,
            FlutterFlowTheme.of(context).secondaryText,
          ),
          width: valueOrDefault<double>(
            widget!.buttonBorderWidth,
            1.0,
          ),
        ),
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          widget!.buttonRadius,
          16.0,
        )),
      ),
    ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!);
  }
}
