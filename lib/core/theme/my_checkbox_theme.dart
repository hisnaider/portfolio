import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';

class MyCheckboxTheme {
  const MyCheckboxTheme._();

  static CheckboxThemeData dark = CheckboxThemeData(
    checkColor: const WidgetStatePropertyAll(Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.primary;
      }
      return const Color(0xff29292e);
    }),
  );
}
