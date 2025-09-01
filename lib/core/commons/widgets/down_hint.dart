import 'package:flutter/material.dart';
import 'package:portfolio/core/values/fonts.dart';

class DownHint extends StatelessWidget {
  const DownHint({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontFamily: Fonts.poppins,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        const Icon(Icons.keyboard_arrow_down_rounded, size: 42),
      ],
    );
  }
}
