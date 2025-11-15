import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/my_colors.dart';

class MyTextButtonTheme {
  static ButtonStyle dark = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 40)),
      maximumSize: const WidgetStatePropertyAll(Size.fromHeight(70)),
      foregroundColor: const WidgetStatePropertyAll(MyColors.primary),
      visualDensity: VisualDensity.standard,
      padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
      animationDuration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      textStyle: WidgetStatePropertyAll(MyTextTheme.dark.bodyMedium!
          .copyWith(color: MyColors.primary, fontWeight: FontWeight.w700)));
}
