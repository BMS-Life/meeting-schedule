import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'otp_model.dart';
export 'otp_model.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({
    super.key,
    this.pinLenght,
    this.timer,
    this.timerFontColor,
    this.timerFontSize,
    this.expireWording,
    this.expireWordingFontColor,
    this.expireWordingFontSize,
    this.countDownWording,
    this.countDownWordingFontColor,
    this.countDownWordingFontSize,
    this.fieldSize,
    this.fieldRadius,
    this.fieldBorder,
    this.activeColor,
    this.inactiveColor,
    this.selectedColor,
    this.cursorColor,
    this.pinFontSize,
    this.pinFontColor,
    this.onCompleted,
  });

  final int? pinLenght;
  final int? timer;
  final Color? timerFontColor;
  final double? timerFontSize;
  final String? expireWording;
  final Color? expireWordingFontColor;
  final double? expireWordingFontSize;
  final String? countDownWording;
  final Color? countDownWordingFontColor;
  final double? countDownWordingFontSize;
  final double? fieldSize;
  final double? fieldRadius;
  final double? fieldBorder;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? selectedColor;
  final Color? cursorColor;
  final double? pinFontSize;
  final Color? pinFontColor;
  final Future Function()? onCompleted;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late OtpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

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
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PinCodeTextField(
              autoDisposeControllers: false,
              appContext: context,
              length: valueOrDefault<int>(
                widget!.pinLenght,
                6,
              ),
              textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget!.pinFontColor,
                      Color(0xFF194987),
                    ),
                    fontSize: valueOrDefault<double>(
                      widget!.pinFontSize,
                      16.0,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              enableActiveFill: false,
              autoFocus: true,
              focusNode: _model.pinCodeFocusNode,
              enablePinAutofill: false,
              errorTextSpace: 16.0,
              showCursor: true,
              cursorColor: valueOrDefault<Color>(
                widget!.cursorColor,
                FlutterFlowTheme.of(context).primaryText,
              ),
              obscureText: false,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              pinTheme: PinTheme(
                fieldHeight: valueOrDefault<double>(
                  widget!.fieldSize,
                  48.0,
                ),
                fieldWidth: valueOrDefault<double>(
                  widget!.fieldSize,
                  48.0,
                ),
                borderWidth: valueOrDefault<double>(
                  widget!.fieldBorder,
                  2.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(valueOrDefault<double>(
                    widget!.fieldRadius,
                    8.0,
                  )),
                  bottomRight: Radius.circular(valueOrDefault<double>(
                    widget!.fieldRadius,
                    8.0,
                  )),
                  topLeft: Radius.circular(valueOrDefault<double>(
                    widget!.fieldRadius,
                    8.0,
                  )),
                  topRight: Radius.circular(valueOrDefault<double>(
                    widget!.fieldRadius,
                    8.0,
                  )),
                ),
                shape: PinCodeFieldShape.box,
                activeColor: valueOrDefault<Color>(
                  widget!.activeColor,
                  FlutterFlowTheme.of(context).alternate,
                ),
                inactiveColor: valueOrDefault<Color>(
                  widget!.inactiveColor,
                  FlutterFlowTheme.of(context).alternate,
                ),
                selectedColor: valueOrDefault<Color>(
                  widget!.selectedColor,
                  FlutterFlowTheme.of(context).secondaryText,
                ),
                activeFillColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                inactiveFillColor: FlutterFlowTheme.of(context).alternate,
                selectedFillColor:
                    FlutterFlowTheme.of(context).primaryBackground,
              ),
              controller: _model.pinCodeController,
              onChanged: (_) {},
              onCompleted: (_) async {
                await widget.onCompleted?.call();
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: _model.pinCodeControllerValidator.asValidator(context),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.isTimerEnd == true)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.expireWording,
                          'รหัส OTP หมดอายุแล้ว',
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
                                widget!.expireWordingFontColor,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              fontSize: valueOrDefault<double>(
                                widget!.expireWordingFontSize,
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
                    ].divide(SizedBox(width: 4.0)),
                  ),
                if (_model.isTimerEnd == false)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.countDownWording,
                            'รหัสจะหมดอายุภายใน',
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
                                  widget!.countDownWordingFontColor,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                fontSize: valueOrDefault<double>(
                                  widget!.countDownWordingFontSize,
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
                      ),
                      FlutterFlowTimer(
                        initialTime: valueOrDefault<int>(
                          widget!.timer,
                          120000,
                        ),
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) safeSetState(() {});
                        },
                        onEnded: () async {
                          _model.isTimerEnd = true;
                          safeSetState(() {});
                        },
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.ibmPlexSansThaiLooped(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    widget!.timerFontColor,
                                    Color(0xFF194987),
                                  ),
                                  fontSize: valueOrDefault<double>(
                                    widget!.timerFontSize,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                FFButtonWidget(
                  onPressed: (_model.isTimerEnd == false)
                      ? null
                      : () async {
                          _model.timerController.onResetTimer();

                          _model.timerController.onStartTimer();
                          _model.isTimerEnd = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.pinCodeController?.clear();
                          });
                        },
                  text: 'ขอ OTP ใหม่',
                  icon: Icon(
                    Icons.refresh,
                    size: 16.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.ibmPlexSansThaiLooped(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                    disabledTextColor: Color(0x3F000000),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
