import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/views/recommendations/entity/recommendation_entity.dart';

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
    // TODO: implement initState
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration tickerElapsed) {
    if (!hoveringCard) {
      targetPosition += 0.5;
    }
    position = lerpDouble(position, targetPosition, 0.1)!;
    _controller.jumpTo(position);
    setState(() {});
    if ((targetPosition - position).abs() < 0.001) {
      _ticker.stop();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _ticker.stop();
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      color: MyColors.altBackgroud,
      child: SizedBox(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          controller: _controller,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _RecommendationCard(
                recommendation: widget.recommendations[index],
                onHover: (isHover) => hoveringCard = isHover,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RecommendationCard extends StatefulWidget {
  const _RecommendationCard(
      {super.key, required this.recommendation, required this.onHover});
  final RecommendationEntity recommendation;
  final Function(bool isHover) onHover;

  @override
  State<_RecommendationCard> createState() => __RecommendationCardState();
}

class __RecommendationCardState extends State<_RecommendationCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        widget.onHover(true);
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        widget.onHover(false);
        setState(() {
          isHovering = false;
        });
      },
      child: AnimatedScale(
        scale: isHovering ? 1.1 : 1,
        duration: Duration(milliseconds: 250),
        alignment: Alignment.topCenter,
        child: Material(
            color: Colors.black12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: SizedBox(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(24),
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
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontFamily: Fonts.poppins,
                          ),
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: Text(
                        widget.recommendation.text,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
