import 'package:flutter/material.dart';
import 'package:portfolio/core/route/route_paths.dart';
import 'package:portfolio/src/scroll_section/scroll_section.dart';
import 'package:portfolio/src/star_system/star_system_page.dart';

class AppRoutes {
  static Widget resolve(String route) {
    switch (route) {
      case RoutePaths.starSystem:
        return const StarSystemPage();
      case RoutePaths.inital:
      default:
        return const ScrollSection();
    }
  }
}
