import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.backgroud,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1920),
          padding: const EdgeInsets.fromLTRB(120, 60, 120, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
