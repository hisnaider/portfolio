import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/views/about_me/about_me_page.dart';
import 'package:portfolio/src/views/hero_page/hero_page.dart';
import 'package:portfolio/src/views/highlight/highlight_page.dart';
import 'package:portfolio/src/views/recommendations/recommendations_page.dart';
import 'package:portfolio/src/views/star_system/star_system_page.dart';
import 'package:portfolio/src/views/welcome/welcome.dart';
import 'package:portfolio/src/widgets/scrollable_container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _scrollNormalized = ValueNotifier(0);
  final int _maxScroll = 1;
  late final Ticker _ticker;
  double _currentScroll = 0;
  double _targetScroll = 0;
  bool _stopAnimation = false;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration onTick) {
    const double smoothingFactor = 0.05;
    _currentScroll =
        lerpDouble(_currentScroll, _targetScroll, smoothingFactor)!;
    if ((_targetScroll - _currentScroll).abs() < 0.0001) {
      _currentScroll = _targetScroll;
      _ticker.stop();
    }
    _scrollNormalized.value = _currentScroll / _maxScroll;
  }

  void _onScroll(double delta) {
    if (!_stopAnimation) {
      _targetScroll += delta * 0.00025;
      _targetScroll = _targetScroll.clamp(0, _maxScroll).toDouble();
      if (!_ticker.isTicking) {
        _ticker.start();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 3000,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.universe),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xdd030F0F),
            ),
            StarSystemPage(),
            // Listener(
            //   behavior: HitTestBehavior.translucent,
            //   onPointerSignal: (event) {
            //     if (event is PointerScrollEvent) {
            //       _onScroll(event.scrollDelta.dy);
            //     }
            //   },
            //   child: ValueListenableBuilder(
            //       valueListenable: _scrollNormalized,
            //       builder: (context, value, child) {
            //         return Stack(
            //           children: [
            //             ///Container(color: Color.fromARGB(49, 7, 36, 36)),
            //             if (_scrollNormalized.value <= 0.25)
            //               Welcome(
            //                   scrollValue: _scrollNormalized,
            //                   start: 0,
            //                   end: 0.25),
            //             if (_scrollNormalized.value <= 0.5)
            //               HeroPage(
            //                   scrollValue: _scrollNormalized,
            //                   start: 0.2,
            //                   end: 0.5),
            //             if (_scrollNormalized.value >= 0.45 &&
            //                 _scrollNormalized.value <= 1)
            //               ScrollableContainer(
            //                 scrollValue: _scrollNormalized,
            //                 start: 0.45,
            //                 end: 1,
            //                 children: (value) => [
            //                   const AboutMePage(),
            //                   const HighlightPage(),
            //                   const RecommendationsPage()
            //                 ],
            //               ),
            //             Text('$_currentScroll\n${_scrollNormalized.value}'),
            //           ],
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
