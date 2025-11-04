import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer(
      {super.key,
      required this.title,
      required this.child,
      this.padding = const EdgeInsets.fromLTRB(0, 60, 0, 0)});
  final String title;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.backgroud,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1500),
          padding: padding,
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
