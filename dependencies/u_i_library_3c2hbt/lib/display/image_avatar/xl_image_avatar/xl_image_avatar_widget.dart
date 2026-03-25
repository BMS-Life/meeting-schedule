import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'xl_image_avatar_model.dart';
export 'xl_image_avatar_model.dart';

class XlImageAvatarWidget extends StatefulWidget {
  const XlImageAvatarWidget({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  State<XlImageAvatarWidget> createState() => _XlImageAvatarWidgetState();
}

class _XlImageAvatarWidgetState extends State<XlImageAvatarWidget> {
  late XlImageAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => XlImageAvatarModel());

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
      width: 80.0,
      height: 80.0,
      fit: BoxFit.contain,
    );
  }
}
