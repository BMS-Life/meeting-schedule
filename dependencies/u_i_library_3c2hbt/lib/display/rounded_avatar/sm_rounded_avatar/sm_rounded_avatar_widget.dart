import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sm_rounded_avatar_model.dart';
export 'sm_rounded_avatar_model.dart';

class SmRoundedAvatarWidget extends StatefulWidget {
  const SmRoundedAvatarWidget({
    super.key,
    required this.image,
    double? radius,
  }) : this.radius = radius ?? 8.0;

  final String? image;
  final double radius;

  @override
  State<SmRoundedAvatarWidget> createState() => _SmRoundedAvatarWidgetState();
}

class _SmRoundedAvatarWidgetState extends State<SmRoundedAvatarWidget> {
  late SmRoundedAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmRoundedAvatarModel());

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
      borderRadius: BorderRadius.circular(valueOrDefault<double>(
        widget!.radius,
        8.0,
      )),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            widget!.radius,
            8.0,
          )),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Image.network(
          valueOrDefault<String>(
            widget!.image,
            'https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8cHJvZmlsZXxlbnwwfHx8fDE3NjM0NDI0NDF8MA&ixlib=rb-4.1.0&q=80&w=1080',
          ),
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment(0.0, 0.0),
        ),
      ),
    );
  }
}
