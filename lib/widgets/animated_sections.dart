import 'package:flutter/material.dart';

class AnimatedSection extends StatelessWidget {
  final Widget child;
  final bool isVisible;

  const AnimatedSection({
    super.key,
    required this.child,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {

    const fastAnimationDuration = Duration(milliseconds: 500);


    return AnimatedOpacity(
      duration: fastAnimationDuration,
      opacity: isVisible ? 1.0 : 0.0,
      curve: Curves.easeInOut,
      child: AnimatedSlide(
        duration:fastAnimationDuration,
        offset: isVisible ? Offset.zero : const Offset(0, 0.2),
        curve: Curves.easeOutCubic,
        child: AnimatedScale(
          duration:fastAnimationDuration,
          scale: isVisible ? 1.0 : 0.9,
          curve: Curves.easeOutCubic,
          child: child,
        ),
      ),
    );
  }
}