import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/controller/analytics.dart';
import 'package:portfolio/src/main_page/widgets/smooth_scroll.dart';

import 'package:portfolio/src/main_page/views/scroll_section/views/intro/intro_section.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/about_me/about_me_page.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/highlight/highlight_page.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/recommendations/recommendations_page.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/transition_navigation/transition_navigation.dart';
import 'package:portfolio/src/main_page/widgets/section_divider.dart';

class ScrollSection extends StatefulWidget {
  const ScrollSection({super.key, required this.enableScroll});
  final bool enableScroll;

  @override
  State<ScrollSection> createState() => _ScrollSectionState();
}

class _ScrollSectionState extends State<ScrollSection> {
  final ScrollController controller = ScrollController();
  Timer? _debounce;
  double _lastScroll = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(_listener);
    _debounce?.cancel();
    super.initState();
  }

  void _listener() {
    // Cancela o timer anterior sempre que houver scroll
    _debounce?.cancel();

    // Cria um novo timer – só dispara se o scroll parar
    _debounce = Timer(const Duration(milliseconds: 150), () {
      print(controller.offset - _lastScroll);
      Analytics.instance.getScrollEvent(speed: controller.offset - _lastScroll);
      _lastScroll = controller.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmoothScroll(
      controller: controller,
      enableScroll: widget.enableScroll,
      slivers: [
        IntroSection(
          scrollController: controller,
        ),
        const AboutMePage(),
        const SectionDivider(),
        const HighlightPage(),
        const SectionDivider(),
        const RecommendationsPage(),
        const TransitionNavigationSection(),
      ],
    );
  }
}
