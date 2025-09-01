import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/dark_theme.dart';
import 'package:portfolio/src/main_page.dart';

void main() {
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
        home: MainPage());
  }
}
