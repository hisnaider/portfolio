import 'package:flutter/material.dart';

class BottomToTopAnimation extends StatefulWidget {
  final Widget child;
  final bool condition;

  const BottomToTopAnimation({
    super.key,
    required this.child,
    required this.condition,
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
      duration: const Duration(milliseconds: 500),
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
    _animate();
  }

  @override
  void didUpdateWidget(covariant BottomToTopAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.condition != widget.condition) {
      _animate();
    }
  }

  void _animate() {
    if (widget.condition && _controller.status != AnimationStatus.completed) {
      _controller.forward();
    } else if (!widget.condition &&
        _controller.status != AnimationStatus.dismissed) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
    );
  }
}
