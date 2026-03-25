// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class RippleWrapper extends StatefulWidget {
  const RippleWrapper({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    required this.action,
    this.splashColor,
    this.splashOpacity,
  });

  final double? width;
  final double? height;
  final double? borderRadius;

  /// Action to perform when tapped
  final Future Function() action;

  /// Custom ripple color (defaults to grey)
  final Color? splashColor;

  /// Custom opacity for ripple effect (0.0–1.0)
  final double? splashOpacity;

  @override
  State<RippleWrapper> createState() => _RippleWrapperState();
}

class _RippleWrapperState extends State<RippleWrapper> {
  @override
  Widget build(BuildContext context) {
    final double radius = widget.borderRadius ?? 8;
    final Color baseColor = widget.splashColor ?? Colors.grey;
    final double opacity = (widget.splashOpacity != null)
        ? widget.splashOpacity!.clamp(0.0, 1.0)
        : 0.3; // Default opacity

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          splashColor: baseColor.withOpacity(opacity),
          highlightColor: baseColor.withOpacity(opacity * 0.2),
          hoverColor: Colors.transparent, // No hover overlay
          focusColor: Colors.transparent, // No focus highlight
          onTap: widget.action,
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
