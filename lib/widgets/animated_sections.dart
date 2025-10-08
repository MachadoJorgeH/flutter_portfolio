import 'package:flutter/material.dart';

class AnimatedSection extends StatelessWidget {
  final Widget child;
  final bool isVisible;
  final Duration duration;
  final Curve curve;

  const AnimatedSection({
    super.key,
    required this.child,
    required this.isVisible,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedOpacity(
        duration: duration,
        opacity: isVisible ? 1.0 : 0.0,
        curve: curve,
        child: AnimatedSlide(
          duration: duration,
          offset: isVisible ? Offset.zero : const Offset(0, 0.1),
          curve: curve,
          child: child,
        ),
      ),
    );
  }
}