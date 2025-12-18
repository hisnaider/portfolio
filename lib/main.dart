// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/dark_theme.dart';
import 'package:portfolio/analytics.dart';
import 'package:portfolio/src/splash/splash_page.dart';

void main() {
  ///debugPrintRebuildDirtyWidgets = true;
  LicenseRegistry.addLicense(() async* {
    yield const LicenseEntryWithLineBreaks(
      ['Hisnaider Ribeiro Campello'],
      '''
      Este trabalho está licenciado sob a Licença Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International. 
      Para visualizar uma cópia desta licença, visite:
      https://creativecommons.org/licenses/by-nc-nd/4.0/
      ''',
    );
  });
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Analytics.instance.init(Theme.of(context).platform);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HC.Dev',
        theme: darkTheme, // escuro como tema base
        darkTheme: darkTheme, // redundante, mas mantém compatibilidade
        themeMode: ThemeMode.dark,
        home: const SplashPage());
  }
}
