import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    return Material(
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
            return MouseRegion(
              onHover: (event) => hoveringCard = true,
              onExit: (event) => hoveringCard = false,
              child: Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 12),
                width: 500,
                child: Text(
                    '${index % widget.recommendations.length} - ${widget.recommendations[index % widget.recommendations.length].name}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
