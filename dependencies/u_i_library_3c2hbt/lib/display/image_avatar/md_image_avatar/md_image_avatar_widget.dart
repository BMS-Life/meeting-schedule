import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'md_image_avatar_model.dart';
export 'md_image_avatar_model.dart';

class MdImageAvatarWidget extends StatefulWidget {
  const MdImageAvatarWidget({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  State<MdImageAvatarWidget> createState() => _MdImageAvatarWidgetState();
}

class _MdImageAvatarWidgetState extends State<MdImageAvatarWidget> {
  late MdImageAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MdImageAvatarModel());

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
      width: 40.0,
      height: 40.0,
      fit: BoxFit.contain,
    );
  }
}
