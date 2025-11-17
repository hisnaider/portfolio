import 'package:flutter/material.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/main_page/sections/intro_section.dart';
import 'package:portfolio/src/main_page/views/about_me/about_me_page.dart';
import 'package:portfolio/src/main_page/views/highlight/highlight_page.dart';
import 'package:portfolio/src/main_page/views/recommendations/recommendations_page.dart';
import 'package:portfolio/src/main_page/widgets/section_divider.dart';
import 'package:portfolio/src/main_page/widgets/smooth_scroll.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.universe),
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 3, 95, 95), BlendMode.screen),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xdd030F0F),
            ),
            // Container(
            //   color: Color.fromARGB(150, 7, 36, 36),
            // ),
            //TODO: sprint de estrela
            SmoothScroll(
              controller: controller,
              child: CustomScrollView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  IntroSection(controller: controller),
                  SliverToBoxAdapter(
                      child: Column(children: [
                    AboutMePage(),
                    SectionDivider(),
                    HighlightPage(),
                    SectionDivider(),
                    RecommendationsPage(),
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
