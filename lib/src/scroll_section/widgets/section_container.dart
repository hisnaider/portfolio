import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/analytics.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionContainer extends StatefulWidget {
  const SectionContainer({
    required ValueKey<String> key,
    required this.title,
    this.subtitle,
    required this.child,
    this.maxWidth = 1500,
    this.padding = const EdgeInsets.fromLTRB(0, 60, 0, 60),
    this.titlePadding = EdgeInsets.zero,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;
  final double maxWidth;

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SelectionArea(
        child: Material(
          color: MyColors.backgroud,
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: widget.maxWidth),
              padding: widget.padding,
              child: VisibilityDetector(
                key: ValueKey(widget.title),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction >= 0.1 && !_isVisible) {
                    _isVisible = true;
                    Analytics.instance.getSectionReachedEvent(
                        section: (widget.key as ValueKey<String>).value);
                  } else if (info.visibleFraction < 0.1 && _isVisible) {
                    _isVisible = false;
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: widget.titlePadding,
                      child: Text(
                        widget.title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    if (widget.subtitle != null)
                      Opacity(
                        opacity: 0.75,
                        child: Text(
                          widget.subtitle!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    const SizedBox(height: 24),
                    widget.child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
