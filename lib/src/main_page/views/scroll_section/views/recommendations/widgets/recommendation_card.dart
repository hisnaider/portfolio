import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/measure_size.dart';
import 'package:portfolio/core/values/constants.dart';
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
    required this.readMore,
  });
  final double width;
  final RecommendationEntity recommendation;
  final VoidCallback readMore;

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool _isVisible = false;
  double _headerHeight = 0;
  double _textHeight = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final TextPainter painter = TextPainter(
          text: TextSpan(
            text: widget.recommendation.text,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.75),
          ),
          textDirection: TextDirection.ltr,
        );

        painter.layout(maxWidth: widget.width - 24);
        _textHeight = painter.height;
        setState(() {});
      },
    );
  }

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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: widget.width,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: MyColors.backgroud,
                borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MeasureSize(
                  onChange: (size) {
                    _headerHeight = size.height;
                  },
                  maxWidth: widget.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recommendation.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        widget.recommendation.role,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontFamily: Fonts.poppins,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          widget.recommendation.text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(height: 1.75),
                        ),
                      ),
                      if (kRecommendationCard - 24 - _headerHeight <=
                          _textHeight)
                        TextButton(
                            onPressed: widget.readMore,
                            child: const Text('Ler todo'))
                    ],
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
