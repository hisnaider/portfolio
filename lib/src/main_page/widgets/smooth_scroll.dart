import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SmoothScroll extends StatefulWidget {
  const SmoothScroll({
    super.key,
    required this.child,
    required this.controller,
  });
  final Widget child;
  final ScrollController controller;

  @override
  State<SmoothScroll> createState() => _SmoothScrollState();
}

class _SmoothScrollState extends State<SmoothScroll> {
  double _targetScroll = 0;
  final int speed = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _smoothTo(double delta) {
    _targetScroll = ((_targetScroll + delta) * speed)
        .clamp(0, widget.controller.position.maxScrollExtent);

    widget.controller.animateTo(_targetScroll,
        duration: Duration(milliseconds: 250), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          _smoothTo(event.scrollDelta.dy);
        }
      },
      child: widget.child,
    );
  }
}
