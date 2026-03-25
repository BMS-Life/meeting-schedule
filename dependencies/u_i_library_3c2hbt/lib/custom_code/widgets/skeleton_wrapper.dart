// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:skeletonizer/skeletonizer.dart';

class SkeletonWrapper extends StatefulWidget {
  const SkeletonWrapper({
    super.key,
    this.width,
    this.height,
    required this.isLoading,
    this.skeletonColor,
    this.shimmerColor,
    this.duration,
    this.borderRadius,
    required this.child,
  });

  final double? width;
  final double? height;

  /// Whether the skeleton is shown
  final bool isLoading;

  /// Base color of skeleton
  final Color? skeletonColor;

  /// Shimmer highlight color
  final Color? shimmerColor;

  /// Duration of shimmer animation (milliseconds)
  final int? duration;

  /// Rounded corners for skeleton shapes
  final double? borderRadius;

  /// The widget builder function for your actual content
  final Widget Function() child;

  @override
  State<SkeletonWrapper> createState() => _SkeletonWrapperState();
}

class _SkeletonWrapperState extends State<SkeletonWrapper> {
  @override
  Widget build(BuildContext context) {
    final double radius = widget.borderRadius ?? 12.0;
    final Color baseColor = widget.skeletonColor ?? Colors.grey.shade300;
    final Color shimmerColor = widget.shimmerColor ?? Colors.grey.shade100;
    final int shimmerDuration = widget.duration ?? 1200;

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Skeletonizer(
        enabled: widget.isLoading,
        effect: ShimmerEffect(
          baseColor: baseColor,
          highlightColor: shimmerColor,
          duration: Duration(milliseconds: shimmerDuration),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          position: DecorationPosition.foreground, // skeleton overlay only
          child: widget.child(),
        ),
      ),
    );
  }
}
