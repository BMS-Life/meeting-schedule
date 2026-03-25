import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sm_image_avatar_model.dart';
export 'sm_image_avatar_model.dart';

class SmImageAvatarWidget extends StatefulWidget {
  const SmImageAvatarWidget({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  State<SmImageAvatarWidget> createState() => _SmImageAvatarWidgetState();
}

class _SmImageAvatarWidgetState extends State<SmImageAvatarWidget> {
  late SmImageAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmImageAvatarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      valueOrDefault<String>(
        widget!.image,
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/u-i-library-3c2hbt/assets/rcff45ja8ode/avatar-model.png',
      ),
      width: 24.0,
      height: 24.0,
      fit: BoxFit.contain,
    );
  }
}
