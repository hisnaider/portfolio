import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1600),
        child: const Divider(
          height: 0,
          endIndent: 24,
          indent: 24,
          color: Colors.white12,
        ),
      ),
    );
  }
}
