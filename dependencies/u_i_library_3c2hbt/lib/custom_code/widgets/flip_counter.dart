// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:animated_flip_counter/animated_flip_counter.dart'
    as animated_flip;
import 'dart:math';

class FlipCounter extends StatefulWidget {
  const FlipCounter({
    super.key,
    this.width,
    this.height,
    this.value,
    this.textSize,
    this.textColor,
    this.textBold,
    this.duration,
    this.fractionDigits,
  });

  final double? width;
  final double? height;
  final double? value;
  final double? textSize;
  final Color? textColor;
  final bool? textBold;
  final int? duration;
  final int? fractionDigits;

  @override
  State<FlipCounter> createState() => FlipCounterState();
}

class FlipCounterState extends State<FlipCounter> {
  double _currentValue = 0;

  // Default values
  double get _targetValue => widget.value ?? 0;
  double get _textSize => widget.textSize ?? 24.0;
  Color get _textColor => widget.textColor ?? Colors.black;
  bool get _textBold => widget.textBold ?? false;
  int get _duration => widget.duration ?? 500;
  int get _fractionDigits => widget.fractionDigits ?? 0;

  void _triggerAnimation() {
    // Start from a slightly lower value to trigger flip animation
    setState(() {
      _currentValue = max(0, _targetValue - 5);
    });
    Future.delayed(Duration(milliseconds: (_duration * 0.5).toInt()), () {
      if (mounted) {
        setState(() {
          _currentValue = _targetValue;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _triggerAnimation);
  }

  @override
  void didUpdateWidget(FlipCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-trigger animation when value changes
    if (oldWidget.value != widget.value) {
      _triggerAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: animated_flip.AnimatedFlipCounter(
        value: _currentValue,
        fractionDigits: _fractionDigits,
        duration: Duration(milliseconds: _duration),
        textStyle: TextStyle(
          fontSize: _textSize,
          color: _textColor,
          fontWeight: _textBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
