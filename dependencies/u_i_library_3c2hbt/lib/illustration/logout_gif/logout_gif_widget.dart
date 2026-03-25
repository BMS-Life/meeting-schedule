import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'logout_gif_model.dart';
export 'logout_gif_model.dart';

class LogoutGifWidget extends StatefulWidget {
  const LogoutGifWidget({super.key});

  @override
  State<LogoutGifWidget> createState() => _LogoutGifWidgetState();
}

class _LogoutGifWidgetState extends State<LogoutGifWidget> {
  late LogoutGifModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoutGifModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Lottie.asset(
        'packages/u_i_library_3c2hbt/assets/jsons/logout.json',
        width: 400.0,
        height: 156.0,
        fit: BoxFit.contain,
        frameRate: FrameRate(60.0),
        animate: true,
      ),
    );
  }
}
