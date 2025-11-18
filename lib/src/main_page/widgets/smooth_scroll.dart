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
  DateTime _lastEvent = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _smoothTo(PointerScrollEvent event) {
    final now = DateTime.now();
    final diff = now.difference(_lastEvent).inMilliseconds;
    _lastEvent = now;
    if (diff > 50) {
      _targetScroll = ((_targetScroll + event.scrollDelta.dy) * speed)
          .clamp(0, widget.controller.position.maxScrollExtent);

      widget.controller.animateTo(_targetScroll,
          duration: Duration(milliseconds: 250), curve: Curves.linear);
    } else {
      print(diff);
      _targetScroll = (_targetScroll + event.scrollDelta.dy)
          .clamp(0, widget.controller.position.maxScrollExtent);
      widget.controller.jumpTo(_targetScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          _smoothTo(event);
        }
      },
      child: widget.child,
    );
  }
}
