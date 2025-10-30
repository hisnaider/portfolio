import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/my_colors.dart';

class Competence extends StatelessWidget {
  const Competence({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: MyColors.primary),
        color: Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          color: MyColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
