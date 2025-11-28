import 'package:flutter/material.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/main_page/controller/main_page_controller.dart';
import 'package:portfolio/src/main_page/views/intro/intro_section.dart';
import 'package:portfolio/src/main_page/views/about_me/about_me_page.dart';
import 'package:portfolio/src/main_page/views/highlight/highlight_page.dart';
import 'package:portfolio/src/main_page/views/recommendations/recommendations_page.dart';
import 'package:portfolio/src/main_page/views/star_system/star_system_page.dart';
import 'package:portfolio/src/main_page/views/transition_navigation/transition_navigation.dart';
import 'package:portfolio/src/main_page/widgets/section_divider.dart';
import 'package:portfolio/src/main_page/widgets/smooth_scroll.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController controller = ScrollController();
  final MainPageState state = MainPageState();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    state.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.universe),
            fit: BoxFit.cover,
          ),
        ),
        child: MainPageController(
          scrollController: controller,
          state: state,
          child: Stack(
            children: [
              ValueListenableBuilder(
                  valueListenable: state.hideBackground,
                  builder: (context, value, child) {
                    return Visibility(
                        visible: !value,
                        child: Container(
                            color: const Color.fromARGB(150, 3, 95, 95)));
                  }),
              Container(
                color: const Color(0xaa030F0F),
              ),
              ValueListenableBuilder(
                  valueListenable: state.transitionStatus,
                  builder: (context, value, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: value != TransitionStatus.finished
                          ? const StarSystemPage()
                          : SmoothScroll(
                              controller: controller,
                              slivers: const [
                                IntroSection(),
                                AboutMePage(),
                                SectionDivider(),
                                HighlightPage(),
                                SectionDivider(),
                                RecommendationsPage(),
                                TransitionNavigationSection(),
                              ],
                            ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
