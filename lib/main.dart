// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/dark_theme.dart';
import 'package:portfolio/src/main_page/controller/analytics.dart';
import 'package:portfolio/src/main_page/main_page.dart';

void main() {
  ///debugPrintRebuildDirtyWidgets = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Analytics.instance.init(Theme.of(context).platform);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme, // escuro como tema base
        darkTheme: darkTheme, // redundante, mas mantém compatibilidade
        themeMode: ThemeMode.dark,
        home: const MainPage());
  }
}
