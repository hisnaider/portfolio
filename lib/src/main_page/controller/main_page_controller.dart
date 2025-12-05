import 'package:flutter/material.dart';

enum TransitionStatus { notStarted, running, finished }

class MainPageController extends InheritedWidget {
  const MainPageController({
    super.key,
    required super.child,
    required this.state,
  });

  final MainPageState state;

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
  final ValueNotifier<TransitionStatus> transitionStatus =
      ValueNotifier<TransitionStatus>(TransitionStatus.notStarted);

  MainPageState();

  void dispose() {
    hideBackground.dispose();
    transitionStatus.dispose();
  }
}
