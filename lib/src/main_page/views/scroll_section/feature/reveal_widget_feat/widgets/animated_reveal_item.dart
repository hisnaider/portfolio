import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/scroll_section/feature/reveal_widget_feat/reveal_scope.dart';

typedef RevealAnimationBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Widget child,
);

class AnimatedRevealItem extends StatefulWidget {
  final Widget child;
  final double triggerOffsetPx;
  final RevealAnimationBuilder animationBuilder;
  final Duration duration;
  final Curve curve;

  const AnimatedRevealItem({
    super.key,
    required this.child,
    required this.triggerOffsetPx,
    required this.animationBuilder,
    required this.duration,
    this.curve = Curves.easeOut,
  });

  @override
  State<AnimatedRevealItem> createState() => _AnimatedRevealItemState();
}

class _AnimatedRevealItemState extends State<AnimatedRevealItem>
    with SingleTickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  bool _revealed = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RevealScope.of(context).register(_key,
        onReveal: _reveal, triggerOffsetPx: widget.triggerOffsetPx);
  }

  void _reveal() {
    if (_revealed) return;
    _revealed = true;
    _controller.forward();
  }

  @override
  void dispose() {
    RevealScope.of(context).unregister(_key);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.animationBuilder(
        context,
        _animation,
        widget.child,
      ),
    );
  }
}
