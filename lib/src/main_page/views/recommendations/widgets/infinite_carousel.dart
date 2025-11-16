import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/main_page/views/recommendations/entity/recommendation_entity.dart';

class InfiniteCarousel extends StatefulWidget {
  const InfiniteCarousel({super.key, required this.recommendations});
  final List<RecommendationEntity> recommendations;

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
    _ticker = createTicker(_onTick)..start();
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
    setState(() {});
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
    return Container(
      height: 500,
      color: MyColors.altBackgroud,
      child: ListView.builder(
        clipBehavior: Clip.none,
        controller: _controller,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final itemIndex = index % widget.recommendations.length;
          return _RecommendationCard(
            recommendation: widget.recommendations[itemIndex],
            onHover: _onHover,
            onHoverExit: _onHoverExit,
          );
        },
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard(
      {required this.recommendation,
      required this.onHover,
      required this.onHoverExit});
  final RecommendationEntity recommendation;
  final VoidCallback onHover;
  final VoidCallback onHoverExit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 500,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MouseRegion(
            onEnter: (event) => onHover(),
            onExit: (event) => onHoverExit(),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.transparent, // Fim com fade
                ],
                stops: [0.0, 0.89, 1.0],
              ).createShader(bounds),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recommendation.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    recommendation.role,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontFamily: Fonts.poppins,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        recommendation.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.75),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
