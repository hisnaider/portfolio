import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer(
      {super.key,
      required this.title,
      this.subtitle,
      required this.child,
      this.maxWidth = 1500,
      this.padding = const EdgeInsets.fromLTRB(0, 60, 0, 0)});
  final String title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.backgroud,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (subtitle != null)
                Opacity(
                  opacity: 0.75,
                  child: Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              const SizedBox(height: 24),
              child,
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
