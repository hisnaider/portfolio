import 'package:flutter/material.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';

class MyInputDecorationTheme {
  const MyInputDecorationTheme._();
  static InputDecorationTheme dark = InputDecorationTheme(
    labelStyle: const TextStyle(
      fontFamily: Fonts.poppins,
      color: Colors.white70,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: MyColors.primary, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: MyColors.error.withOpacity(0.5), width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: MyColors.error, width: 1),
    ),
    contentPadding: const EdgeInsets.all(10),
    fillColor: const Color(0xff29292e),
    filled: true,
    errorStyle: const TextStyle(
      color: MyColors.error,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      color: Colors.white24,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
  );
}
