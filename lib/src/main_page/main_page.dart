import 'package:flutter/material.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/main_page/controller/main_page_controller.dart';
import 'package:portfolio/src/main_page/views/scroll_section/scroll_section.dart';
import 'package:portfolio/src/main_page/views/star_system/star_system_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageState state = MainPageState();

  @override
  void dispose() {
    super.dispose();
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
          state: state,
          child: Stack(
            children: [
              Container(color: const Color.fromARGB(150, 3, 95, 95)),
              Container(
                color: const Color(0xaa030F0F),
              ),
              ValueListenableBuilder(
                  valueListenable: state.transitionStatus,
                  builder: (context, value, child) {
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: value == TransitionStatus.finished
                            ? const StarSystemPage()
                            : ScrollSection(
                                enableScroll:
                                    value == TransitionStatus.notStarted,
                              ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
