import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/my_button_theme.dart';
import 'package:portfolio/core/theme/my_checkbox_theme.dart';
import 'package:portfolio/core/theme/my_input_decoration_theme.dart';
import 'package:portfolio/core/theme/my_text_button_theme.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/my_colors.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: MyColors.primary,
    surface: MyColors.altBackgroud,
    onSurface: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(style: MyButtonTheme.dark),
  textButtonTheme: TextButtonThemeData(style: MyTextButtonTheme.dark),
  scaffoldBackgroundColor: MyColors.backgroud,
  inputDecorationTheme: MyInputDecorationTheme.dark,
  checkboxTheme: MyCheckboxTheme.dark,
  textTheme: MyTextTheme.dark,
);
