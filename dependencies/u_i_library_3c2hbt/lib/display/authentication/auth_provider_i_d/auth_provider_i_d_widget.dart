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
import 'auth_provider_i_d_model.dart';
export 'auth_provider_i_d_model.dart';

class AuthProviderIDWidget extends StatefulWidget {
  const AuthProviderIDWidget({
    super.key,
    this.borderRadius,
    this.buttonHeight,
    this.containerWidth,
    Color? buttonColor,
    this.upperWordingColor,
    this.upperWordingSize,
    this.navigation,
  }) : this.buttonColor = buttonColor ?? Colors.white;

  final double? borderRadius;
  final double? buttonHeight;
  final double? containerWidth;
  final Color buttonColor;
  final Color? upperWordingColor;
  final double? upperWordingSize;
  final Future Function()? navigation;

  @override
  State<AuthProviderIDWidget> createState() => _AuthProviderIDWidgetState();
}

class _AuthProviderIDWidgetState extends State<AuthProviderIDWidget>
    with TickerProviderStateMixin {
  late AuthProviderIDModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthProviderIDModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.025, 1.025),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.99, 0.99),
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
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ลงชื่อเข้าใช้งานด้วย Provider ID',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.ibmPlexSansThaiLooped(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
                  color: valueOrDefault<Color>(
                    widget!.upperWordingColor,
                    FlutterFlowTheme.of(context).primaryText,
                  ),
                  fontSize: valueOrDefault<double>(
                    widget!.upperWordingSize,
                    16.0,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
          ),
          MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (animationsMap['containerOnActionTriggerAnimation2'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation2']!
                      .controller
                      .forward(from: 0.0);
                }
                await Future.delayed(
                  Duration(
                    milliseconds: 50,
                  ),
                );
                await widget.navigation?.call();
              },
              child: Container(
                width: widget!.containerWidth,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: valueOrDefault<double>(
                        widget!.buttonHeight,
                        80.0,
                      ),
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          widget!.buttonColor,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: valueOrDefault<double>(
                              _model.eventHovered == true ? 12.0 : 0.0,
                              0.0,
                            ),
                            color: _model.eventHovered == true
                                ? Color(0x1428A440)
                                : Color(0x00000000),
                            offset: Offset(
                              0.0,
                              valueOrDefault<double>(
                                _model.eventHovered == true ? 2.0 : 0.0,
                                0.0,
                              ),
                            ),
                          )
                        ],
                        borderRadius:
                            BorderRadius.circular(valueOrDefault<double>(
                          widget!.borderRadius,
                          4.0,
                        )),
                        border: Border.all(
                          color: Color(0xFF28A440),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Image.asset(
                          'packages/u_i_library_3c2hbt/assets/images/provider-id-logo.png',
                          width: double.infinity,
                          height: 64.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ).animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation1']!,
            ),
            onEnter: ((event) async {
              safeSetState(() => _model.eventHovered = true);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                await animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0);
              }
            }),
            onExit: ((event) async {
              safeSetState(() => _model.eventHovered = false);
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                await animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .reverse();
              }
            }),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
