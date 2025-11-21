import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';

class SlideInOutText extends AnimatedText {
  final Offset startOffset;
  final Offset endOffset;
  SlideInOutText({
    required super.text,
    required super.duration,
    required this.startOffset,
    required this.endOffset,
  });

  late Animation<Offset> position;

  @override
  void initAnimation(AnimationController controller) {
    position = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween<Offset>(begin: startOffset, end: Offset.zero),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Offset>(begin: Offset.zero, end: endOffset), weight: 1),
    ]).animate(controller);
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    return Transform.translate(
      offset: position.value, // multiplica pra dar movimento visível
      child: Text(text, style: textStyle),
    );
  }
}

class ScaleShakeText extends AnimatedText {
  ScaleShakeText({
    required super.text,
    required super.duration,
    required this.shakeIntensity,
  });

  final double shakeIntensity;

  late Animation<double> scale;

  @override
  void initAnimation(AnimationController controller) {
    scale = Tween<double>(begin: 0, end: 10).animate(controller);
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    final shakeOffset = sin((scale.value / 10) * shakeIntensity);
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(shakeOffset)
        ..scale(scale.value),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
