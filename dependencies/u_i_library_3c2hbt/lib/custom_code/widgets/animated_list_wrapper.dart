// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListWrapper extends StatefulWidget {
  const AnimatedListWrapper({
    super.key,
    this.width,
    this.height,
    required this.children,
  });

  final double? width;
  final double? height;
  final Widget Function() children;

  @override
  State<AnimatedListWrapper> createState() => _AnimatedListWrapperState();
}

class _AnimatedListWrapperState extends State<AnimatedListWrapper> {
  @override
  Widget build(BuildContext context) {
    final content = widget.children();

    // Handle Column
    if (content is Column) {
      final items = content.children;
      return SizedBox(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        child: AnimationLimiter(
          child: Column(
            children: List.generate(items.length, (index) {
              final item = items[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 80), // delay between items
                duration: const Duration(milliseconds: 450),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  curve: Curves.easeOutCubic,
                  child: FadeInAnimation(
                    child: item,
                  ),
                ),
              );
            }),
          ),
        ),
      );
    }

    // Handle ListView
    if (content is ListView) {
      final delegate = content.childrenDelegate;
      if (delegate is SliverChildListDelegate) {
        final items = delegate.children;
        return SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? double.infinity,
          child: AnimationLimiter(
            child: ListView(
              padding: content.padding,
              scrollDirection: content.scrollDirection,
              children: List.generate(items.length, (index) {
                final item = items[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 80),
                  duration: const Duration(milliseconds: 450),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    curve: Curves.easeOutCubic,
                    child: FadeInAnimation(child: item),
                  ),
                );
              }),
            ),
          ),
        );
      }
    }

    // Fallback for single widgets
    return AnimationLimiter(
      child: AnimationConfiguration.synchronized(
        duration: const Duration(milliseconds: 400),
        child: SlideAnimation(
          verticalOffset: 40.0,
          curve: Curves.easeOutCubic,
          child: FadeInAnimation(child: content),
        ),
      ),
    );
  }
}
