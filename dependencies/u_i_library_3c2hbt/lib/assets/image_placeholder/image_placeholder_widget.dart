import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_placeholder_model.dart';
export 'image_placeholder_model.dart';

class ImagePlaceholderWidget extends StatefulWidget {
  const ImagePlaceholderWidget({super.key});

  @override
  State<ImagePlaceholderWidget> createState() => _ImagePlaceholderWidgetState();
}

class _ImagePlaceholderWidgetState extends State<ImagePlaceholderWidget> {
  late ImagePlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagePlaceholderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'packages/u_i_library_3c2hbt/assets/images/image-placeholder.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
