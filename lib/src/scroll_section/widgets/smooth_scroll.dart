import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/analytics.dart';

class SmoothScroll extends StatefulWidget {
  const SmoothScroll({
    super.key,
    required this.slivers,
    required this.controller,
  });
  final List<Widget> slivers;
  final ScrollController controller;

  @override
  State<SmoothScroll> createState() => _SmoothScrollState();
}

class _SmoothScrollState extends State<SmoothScroll> {
  double _targetScroll = 0;
  final int speed = 1;
  Timer? _debounce;
  double _lastScroll = 0;
  bool _enableScroll = true;
  final bool _isDesktop = [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS
  ].contains(Analytics.instance.getPlatform);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  void _listener() {
    if (widget.controller.position.pixels >
            widget.controller.position.maxScrollExtent - 200 &&
        _enableScroll) {
      _enableScroll = false;
      widget.controller.animateTo(widget.controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1000), curve: Curves.linear);
    }
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 150), () {
      Analytics.instance
          .getScrollEvent(speed: widget.controller.offset - _lastScroll);
      _lastScroll = widget.controller.offset;
    });
  }

  void _smoothTo(PointerScrollEvent event) {
    _targetScroll = ((_targetScroll + event.scrollDelta.dy) * speed)
        .clamp(0, widget.controller.position.maxScrollExtent);
    if (event.scrollDelta.dy.abs() >= 100) {
      widget.controller.animateTo(_targetScroll,
          duration: const Duration(milliseconds: 250), curve: Curves.linear);
    } else {
      widget.controller.jumpTo(_targetScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isDesktop) {
      return Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent && _enableScroll) {
            _smoothTo(event);
          }
        },
        child: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          controller: widget.controller,
          physics: const NeverScrollableScrollPhysics(),
          slivers: widget.slivers,
        ),
      );
    }
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior(),
      physics: _enableScroll ? null : const NeverScrollableScrollPhysics(),
      controller: widget.controller,
      slivers: widget.slivers,
    );
  }
}
