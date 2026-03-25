import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'search_bar_model.dart';
export 'search_bar_model.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    this.textFieldWidth,
    this.placeholder,
    Color? buttonColor,
    this.textFieldBorderRadius,
    this.iconButtonBorderRadius,
    this.textFieldHeight,
    this.iconButtonHeight,
    required this.icon,
    this.iconButtonAction,
    this.masking,
    this.maxLenght,
    this.autoFocus,
  }) : this.buttonColor = buttonColor ?? const Color(0xFF00598A);

  final double? textFieldWidth;
  final String? placeholder;
  final Color buttonColor;
  final double? textFieldBorderRadius;
  final double? iconButtonBorderRadius;
  final double? textFieldHeight;
  final double? iconButtonHeight;
  final Widget? icon;
  final Future Function()? iconButtonAction;
  final String? masking;
  final int? maxLenght;
  final bool? autoFocus;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late SearchBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isSearched = false;
      safeSetState(() {});
      await Future.delayed(
        Duration(
          milliseconds: 300,
        ),
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFieldMask = MaskTextInputFormatter(mask: widget!.masking!);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.0, -1.0),
      children: [
        Container(
          width: widget!.textFieldWidth,
          height: valueOrDefault<double>(
            widget!.textFieldHeight,
            48.0,
          ),
          decoration: BoxDecoration(),
          child: Container(
            width: _model.searchWidth,
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onFieldSubmitted: (_) async {
                safeSetState(() {
                  _model.textController?.clear();
                });
                await widget.iconButtonAction?.call();
              },
              autofocus: widget!.autoFocus == true,
              textInputAction: TextInputAction.search,
              obscureText: false,
              decoration: InputDecoration(
                isDense: false,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.ibmPlexSansThaiLooped(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                hintText: valueOrDefault<String>(
                  widget!.placeholder,
                  'Placeholder',
                ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.ibmPlexSansThaiLooped(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget!.textFieldBorderRadius,
                    24.0,
                  )),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget!.buttonColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget!.textFieldBorderRadius,
                    24.0,
                  )),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget!.textFieldBorderRadius,
                    24.0,
                  )),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget!.textFieldBorderRadius,
                    24.0,
                  )),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
              textAlign: TextAlign.start,
              maxLength: widget!.maxLenght,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              enableInteractiveSelection: true,
              validator: _model.textControllerValidator.asValidator(context),
              inputFormatters: [_model.textFieldMask],
            ),
          ),
        ),
        AlignedTooltip(
          content: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
            child: Text(
              'กดเพื่อค้นหา',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 4.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: valueOrDefault<double>(
                widget!.iconButtonBorderRadius,
                100.0,
              ),
              buttonSize: valueOrDefault<double>(
                widget!.iconButtonHeight,
                40.0,
              ),
              fillColor: valueOrDefault<Color>(
                widget!.buttonColor,
                Color(0xFF00598A),
              ),
              icon: widget!.icon!,
              onPressed: () async {
                _model.isSearched = true;
                safeSetState(() {});
                safeSetState(() {
                  _model.textController?.clear();
                  _model.textFieldMask.clear();
                });
                await widget.iconButtonAction?.call();
              },
            ),
          ),
        ),
      ],
    );
  }
}
