import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/controller/main_page_controller.dart';

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
    final bool isDesktop =
        MainPageController.isDesktop(Theme.of(context).platform);
    if (isDesktop) {
      return Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
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
      controller: widget.controller,
      slivers: widget.slivers,
    );
  }
}
