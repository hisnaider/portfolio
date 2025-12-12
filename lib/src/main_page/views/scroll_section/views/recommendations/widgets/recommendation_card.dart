import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/main_page/controller/analytics.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/recommendations/entity/recommendation_entity.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecommendationCard extends StatefulWidget {
  const RecommendationCard({
    super.key,
    required this.width,
    required this.recommendation,
  });
  final double width;
  final RecommendationEntity recommendation;

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.recommendation.name),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 0.25 && !_isVisible) {
          _isVisible = true;
          Analytics.instance
              .getRecommendationReadEvent(name: widget.recommendation.name);
        } else if (info.visibleFraction < 0.25 && _isVisible) {
          _isVisible = false;
        }
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: widget.width,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: MyColors.backgroud,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recommendation.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      widget.recommendation.role,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontFamily: Fonts.poppins,
                          ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                Flexible(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        widget.recommendation.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.75),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
