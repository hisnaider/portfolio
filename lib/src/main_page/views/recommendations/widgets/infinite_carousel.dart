import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/src/main_page/views/recommendations/entity/recommendation_entity.dart';
import 'package:portfolio/src/main_page/views/recommendations/widgets/recommendation_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double _maxCardWidth = 500;

class InfiniteCarousel extends StatefulWidget {
  const InfiniteCarousel({
    super.key,
    required this.recommendations,
    required this.isDesktop,
  });
  final List<RecommendationEntity> recommendations;
  final bool isDesktop;

  @override
  State<InfiniteCarousel> createState() => _InfiniteCarouselState();
}

class _InfiniteCarouselState extends State<InfiniteCarousel>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late final Ticker _ticker;

  double position = 0;
  double targetPosition = 0;

  bool hoveringCard = false;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
  }

  void _onTick(Duration tickerElapsed) {
    if (!hoveringCard) {
      targetPosition += 0.5;
    }
    position = lerpDouble(position, targetPosition, 0.1)!;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.jumpTo(position);
      }
    });
    if ((targetPosition - position).abs() < 0.001) {
      _ticker.stop();
    }
  }

  void _onHover() {
    hoveringCard = true;
  }

  void _onHoverExit() {
    hoveringCard = false;
    if (!_ticker.isActive) {
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.stop();
    _ticker.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey('infinite_carousel'),
      onVisibilityChanged: (info) {
        if (_ticker.isActive && info.visibleFraction == 0) {
          _ticker.stop();
        } else if (!_ticker.isActive && info.visibleFraction > 0) {
          _ticker.start();
        }
      },
      child: SizedBox(
        height: _maxCardWidth,
        child: ListView.builder(
          clipBehavior: Clip.none,
          controller: _controller,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final itemIndex = index % widget.recommendations.length;
            final RecommendationEntity recommendation =
                widget.recommendations[itemIndex];
            return widget.isDesktop
                ? MouseRegion(
                    onEnter: (event) {
                      _onHover();
                    },
                    onExit: (event) {
                      _onHoverExit();
                    },
                    child: RecommendationCard(
                      width: _maxCardWidth,
                      recommendation: recommendation,
                    ))
                : GestureDetector(
                    onTapDown: (detail) =>
                        hoveringCard ? _onHoverExit() : _onHover(),
                    child: RecommendationCard(
                      width: _maxCardWidth,
                      recommendation: recommendation,
                    ));
          },
        ),
      ),
    );
  }
}
