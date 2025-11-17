import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BottomToTopAnimation extends StatefulWidget {
  final Widget child;

  const BottomToTopAnimation({
    required super.key,
    required this.child,
  });

  @override
  State<BottomToTopAnimation> createState() => _BottomToTopAnimationState();
}

class _BottomToTopAnimationState extends State<BottomToTopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _offset = Tween<Offset>(
      begin: const Offset(0, 0.20), // 20% da altura pra baixo
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key!,
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1 &&
            _controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      },
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _offset,
          child: widget.child,
        ),
      ),
    );
  }
}
