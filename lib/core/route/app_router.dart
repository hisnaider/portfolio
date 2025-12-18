import 'package:flutter/material.dart';
import 'package:portfolio/core/route/app_routes.dart';

class AppRouter {
  static PageRoute build(String route) {
    final page = AppRoutes.resolve(route);

    return PageRouteBuilder(
      opaque: true,
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return FadeTransition(
          opacity: curved,
          child: child,
        );
      },
    );
  }
}
