import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/my_colors.dart';

class MyButtonTheme {
  static ButtonStyle dark = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(const Size(0, 60)),
      maximumSize: const WidgetStatePropertyAll(Size.fromHeight(70)),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white30;
          }
          return MyColors.primary;
        },
      ),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      visualDensity: VisualDensity.standard,
      padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      animationDuration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      textStyle: WidgetStatePropertyAll(MyTextTheme.dark.bodyMedium));
}
