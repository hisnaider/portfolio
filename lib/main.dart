// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/dark_theme.dart';
import 'package:portfolio/src/main_page/main_page.dart';

void main() {
  html.document.documentElement!.style.scrollBehavior = 'smooth';
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: darkTheme, // escuro como tema base
        darkTheme: darkTheme, // redundante, mas mantém compatibilidade
        themeMode: ThemeMode.dark,
        home: const MainPage());
  }
}
