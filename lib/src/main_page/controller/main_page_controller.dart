import 'package:flutter/material.dart';

enum TransitionStatus { notStarted, running, finished }

class MainPageController extends InheritedWidget {
  const MainPageController({
    super.key,
    required super.child,
    required this.state,
    required this.scrollController,
  });

  final MainPageState state;
  final ScrollController scrollController;

  static MainPageController of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MainPageController>()!;

  static bool isDesktop(TargetPlatform platform) => [
        TargetPlatform.windows,
        TargetPlatform.linux,
        TargetPlatform.macOS
      ].contains(platform);

  @override
  bool updateShouldNotify(covariant MainPageController oldWidget) => false;
}

class MainPageState {
  final ValueNotifier<bool> hideBackground = ValueNotifier<bool>(false);
  final ValueNotifier<bool> showSkills = ValueNotifier<bool>(false);
  final ValueNotifier<bool> showWorks = ValueNotifier<bool>(false);
  final ValueNotifier<bool> initRecommendations = ValueNotifier<bool>(false);
  final ValueNotifier<TransitionStatus> transitionStatus =
      ValueNotifier<TransitionStatus>(TransitionStatus.notStarted);

  MainPageState();

  void dispose() {
    hideBackground.dispose();
    showSkills.dispose();
    showWorks.dispose();
    initRecommendations.dispose();
    transitionStatus.dispose();
  }
}
