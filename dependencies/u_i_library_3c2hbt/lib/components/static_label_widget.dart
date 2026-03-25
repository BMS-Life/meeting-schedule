import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'static_label_model.dart';
export 'static_label_model.dart';

class StaticLabelWidget extends StatefulWidget {
  const StaticLabelWidget({
    super.key,
    Color? background,
    this.leftMargin,
    this.topMargin,
    this.rightMargin,
    this.bottomMargin,
    this.gap,
    this.borderRadius,
    this.width,
    this.height,
    this.borderColor,
    this.stroke,
    this.iconSize,
    Color? iconColor,
    this.textSize,
    Color? textColor,
    this.icon,
    this.textValue,
    this.imageURL,
  })  : this.background = background ?? const Color(0x0E2196F3),
        this.iconColor = iconColor ?? Colors.blue,
        this.textColor = textColor ?? Colors.blue;

  final Color background;
  final double? leftMargin;
  final double? topMargin;
  final double? rightMargin;
  final double? bottomMargin;
  final double? gap;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? stroke;
  final double? iconSize;
  final Color iconColor;
  final double? textSize;
  final Color textColor;
  final Widget? icon;
  final String? textValue;
  final String? imageURL;

  @override
  State<StaticLabelWidget> createState() => _StaticLabelWidgetState();
}

class _StaticLabelWidgetState extends State<StaticLabelWidget> {
  late StaticLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaticLabelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.useImageIcon = false;
      safeSetState(() {});
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
      width: widget!.width,
      height: widget!.height,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.background,
          Color(0x0E2196F3),
        ),
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          widget!.borderRadius,
          12.0,
        )),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.borderColor,
            Colors.blue,
          ),
          width: valueOrDefault<double>(
            widget!.stroke,
            1.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              widget!.leftMargin,
              8.0,
            ),
            valueOrDefault<double>(
              widget!.topMargin,
              4.0,
            ),
            valueOrDefault<double>(
              widget!.rightMargin,
              8.0,
            ),
            valueOrDefault<double>(
              widget!.bottomMargin,
              4.0,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget!.imageURL == null || widget!.imageURL == '')
              widget!.icon!,
            if (widget!.imageURL != null && widget!.imageURL != '')
              Container(
                width: valueOrDefault<double>(
                  widget!.iconSize,
                  24.0,
                ),
                height: valueOrDefault<double>(
                  widget!.iconSize,
                  24.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  widget!.imageURL!,
                  fit: BoxFit.cover,
                ),
              ),
            Text(
              valueOrDefault<String>(
                widget!.textValue,
                '{labelValue}',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget!.textColor,
                      Colors.blue,
                    ),
                    fontSize: widget!.textSize,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(
              width: valueOrDefault<double>(
            widget!.gap,
            4.0,
          ))),
        ),
      ),
    );
  }
}
