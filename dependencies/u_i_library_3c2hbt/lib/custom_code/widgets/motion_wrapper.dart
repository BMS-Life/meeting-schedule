// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:motion/motion.dart';

class MotionWrapper extends StatefulWidget {
  const MotionWrapper({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.borderRadius,
    this.glare,
    this.shadow,
  });

  final double? width;
  final double? height;
  final Widget Function() child;
  final double? borderRadius;
  final bool? glare;
  final bool? shadow;

  @override
  State<MotionWrapper> createState() => _MotionWrapperState();
}

class _MotionWrapperState extends State<MotionWrapper> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initMotion();
  }

  Future<void> _initMotion() async {
    if (!_initialized) {
      await Motion.instance.initialize();
      Motion.instance.setUpdateInterval(60.fps);
      setState(() => _initialized = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const SizedBox.shrink();
    }

    return Motion.elevated(
      elevation: 8,
      glare: widget.glare ?? true,
      shadow: widget.shadow ?? false,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: widget.child(),
      ),
    );
  }
}
