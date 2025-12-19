import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/app_scafoold.dart';
import 'package:portfolio/src/scroll_section/feature/reveal_widget_feat/reveal_scope.dart';
import 'package:portfolio/src/scroll_section/widgets/smooth_scroll.dart';

import 'package:portfolio/src/scroll_section/views/intro/intro_section.dart';
import 'package:portfolio/src/scroll_section/views/about_me/about_me_page.dart';
import 'package:portfolio/src/scroll_section/views/highlight/highlight_page.dart';
import 'package:portfolio/src/scroll_section/views/recommendations/recommendations_page.dart';
import 'package:portfolio/src/scroll_section/views/transition_navigation/transition_navigation.dart';
import 'package:portfolio/src/scroll_section/widgets/section_divider.dart';

class ScrollSection extends StatefulWidget {
  const ScrollSection({super.key});

  @override
  State<ScrollSection> createState() => _ScrollSectionState();
}

class _ScrollSectionState extends State<ScrollSection> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScafoold(
      child: RevealScope(
        controller: controller,
        child: SmoothScroll(
          controller: controller,
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
        ),
      ),
    );
  }
}
