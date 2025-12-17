import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/recommendations/entity/recommendation_entity.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/recommendations/modal/recommendation_modal.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/recommendations/widgets/recommendation_card.dart';

class RecommendationCarousel extends StatefulWidget {
  const RecommendationCarousel({
    super.key,
    required this.recommendations,
    required this.maxWidth,
  });
  final List<RecommendationEntity> recommendations;
  final double maxWidth;

  @override
  State<RecommendationCarousel> createState() => _RecommendationCarouselState();
}

class _RecommendationCarouselState extends State<RecommendationCarousel> {
  late PageController pageController;

  int _index = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        viewportFraction: getViewportFraction(), initialPage: 1002);
    pageController.addListener(_onPageChange);
  }

  double getViewportFraction() =>
      widget.maxWidth.normalize(1200, min: 500).getInterval(0.47, 1);

  @override
  void didUpdateWidget(covariant RecommendationCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.maxWidth != widget.maxWidth) {
      final double currentPage = pageController.page ?? 0;

      pageController.removeListener(_onPageChange);
      setState(() {
        pageController = PageController(
          viewportFraction: getViewportFraction(),
          initialPage: currentPage.round(),
        );
      });

      pageController.addListener(_onPageChange);
    }
  }

  void _onPageChange() {
    final int newPage =
        (pageController.page ?? 0).round() % widget.recommendations.length;
    if (_index != newPage) {
      setState(() {
        _index = newPage;
      });
    }
  }

  @override
  void dispose() {
    pageController.removeListener(_onPageChange);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 535,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  final itemIndex = index % widget.recommendations.length;
                  final RecommendationEntity recommendation =
                      widget.recommendations[itemIndex];
                  return RecommendationCard(
                    width: 500,
                    recommendation: recommendation,
                    readMore: () =>
                        RecommendationModal.open(context, recommendation),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.recommendations.length,
                (index) {
                  final bool currentIndex = _index == index;
                  final double size = currentIndex ? 15 : 10;
                  return AnimatedContainer(
                    alignment: Alignment.center,
                    width: size,
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: currentIndex
                            ? MyColors.primary
                            : MyColors.backgroudDarker),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
