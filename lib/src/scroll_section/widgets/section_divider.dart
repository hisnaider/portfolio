import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: MyColors.backgroud,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1600),
            child: const Divider(
              height: 1,
              endIndent: 24,
              indent: 24,
              color: Colors.white12,
            ),
          ),
        ),
      ),
    );
  }
}
