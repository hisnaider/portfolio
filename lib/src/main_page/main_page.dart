import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/main_page/sections/intro_section.dart';
import 'package:portfolio/src/main_page/sections/transition_navigation_section.dart';
import 'package:portfolio/src/main_page/views/about_me/about_me_page.dart';
import 'package:portfolio/src/main_page/views/highlight/highlight_page.dart';
import 'package:portfolio/src/main_page/views/recommendations/recommendations_page.dart';
import 'package:portfolio/src/main_page/views/star_system/star_system_page.dart';
import 'package:portfolio/src/main_page/widgets/section_divider.dart';
import 'package:portfolio/src/main_page/widgets/smooth_scroll.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController controller = ScrollController();

  final ValueNotifier<bool> showBackgroundColor = ValueNotifier(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(_listener);
  }

  void _listener() {
    showBackgroundColor.value =
        controller.offset > MediaQuery.of(context).size.height + 1000
            ? false
            : true;
  }

  @override
  Widget build(BuildContext context) {
    print('asdasd');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.universe),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: showBackgroundColor,
                builder: (context, value, child) {
                  return Visibility(
                      visible: value,
                      child: Container(color: Color.fromARGB(150, 3, 95, 95)));
                }),
            Container(
              color: const Color(0xaa030F0F),
            ),
            SmoothScroll(
              controller: controller,
              child: CustomScrollView(
                scrollBehavior: ScrollBehavior(),
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  IntroSection(controller: controller),
                  const SliverToBoxAdapter(
                    child: Column(
                      children: [
                        AboutMePage(),
                        SectionDivider(),
                        HighlightPage(),
                        SectionDivider(),
                        RecommendationsPage(),
                      ],
                    ),
                  ),
                  TransitionNavigationSection(controller: controller)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
