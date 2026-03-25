import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gradient_box_model.dart';
export 'gradient_box_model.dart';

class GradientBoxWidget extends StatefulWidget {
  const GradientBoxWidget({
    super.key,
    this.textColor,
    this.primaryGradient,
    this.secondaryGradient,
  });

  final Color? textColor;
  final Color? primaryGradient;
  final Color? secondaryGradient;

  @override
  State<GradientBoxWidget> createState() => _GradientBoxWidgetState();
}

class _GradientBoxWidgetState extends State<GradientBoxWidget> {
  late GradientBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.primaryColor = widget!.primaryGradient;
      safeSetState(() {});
      _model.secondaryColor = widget!.secondaryGradient;
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
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            valueOrDefault<Color>(
              _model.primaryColor,
              FlutterFlowTheme.of(context).primary,
            ),
            valueOrDefault<Color>(
              _model.secondaryColor,
              FlutterFlowTheme.of(context).secondary,
            )
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        'Hello World',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: widget!.textColor,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
