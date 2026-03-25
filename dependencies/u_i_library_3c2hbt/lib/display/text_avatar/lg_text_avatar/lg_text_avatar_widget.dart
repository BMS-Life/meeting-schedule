import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lg_text_avatar_model.dart';
export 'lg_text_avatar_model.dart';

class LgTextAvatarWidget extends StatefulWidget {
  const LgTextAvatarWidget({
    super.key,
    String? initText,
    Color? bgColor,
    Color? textColor,
  })  : this.initText = initText ?? 'TW',
        this.bgColor = bgColor ?? Colors.black,
        this.textColor = textColor ?? Colors.white;

  final String initText;
  final Color bgColor;
  final Color textColor;

  @override
  State<LgTextAvatarWidget> createState() => _LgTextAvatarWidgetState();
}

class _LgTextAvatarWidgetState extends State<LgTextAvatarWidget> {
  late LgTextAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LgTextAvatarModel());

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
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.bgColor,
          Colors.white,
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        valueOrDefault<String>(
          widget!.initText,
          'TW',
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.ibmPlexSansThaiLooped(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: widget!.textColor,
              fontSize: 24.0,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
      ),
    );
  }
}
