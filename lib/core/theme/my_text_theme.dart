import 'package:flutter/material.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';

class MyTextTheme {
  static TextTheme dark = const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w900,
        color: MyColors.primary,
        fontFamily: Fonts.poppins),
    headlineMedium: TextStyle(
        fontSize: 36, fontWeight: FontWeight.w600, fontFamily: Fonts.poppins),
    titleLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w900,
      fontFamily: Fonts.poppins,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.poppins,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: Fonts.poppins,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      color: Colors.white54,
      fontFamily: Fonts.montserrat,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      height: 1.5,
      fontFamily: Fonts.montserrat,
    ),
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: Fonts.poppins,
        color: Colors.white54),
  );
}
