import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/commons/widgets/down_hint.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/orbiting_system_widget.dart';
import 'package:portfolio/src/views/about_me/about_me_page.dart';
import 'package:portfolio/src/views/all_works/all_works_page.dart';
import 'package:portfolio/src/views/hero_page/hero_page.dart';
import 'package:portfolio/src/views/highlight/highlight_page.dart';
import 'package:portfolio/src/views/star_system/star_system_page.dart';
import 'package:portfolio/src/views/welcome/welcome.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  double _scrollDy = 0;
  ValueNotifier<double> _scrollNormalized = ValueNotifier(0);
  final int _maxScroll = 1;
  late final Ticker _ticker;
  double _currentScroll = 0;
  double _targetScroll = 0;
  bool _end = false;

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
    print('asdasdasdasd: ${_ticker.isActive}');
    if (!_end) {
      const double smoothingFactor = 0.05;
      _currentScroll =
          lerpDouble(_currentScroll, _targetScroll, smoothingFactor)!;

      if ((_targetScroll - _currentScroll).abs() < 0.001) {
        _currentScroll = _targetScroll;
        _ticker.stop();
      }
      _scrollNormalized.value = _currentScroll / _maxScroll;
      if (_scrollNormalized.value == 1) {
        if (_ticker.isTicking) {
          _ticker.stop();
        }
        _end = true;
      }
    }
  }

  void _onScroll(double delta) {
    _targetScroll += delta * 0.00025;
    _targetScroll = _targetScroll.clamp(0, _maxScroll).toDouble();
    if (!_ticker.isTicking) {
      _ticker.start();
    }
    if (_scrollNormalized.value == 1) {
      if (_ticker.isTicking) {
        _ticker.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.universe),
            fit: BoxFit.cover,
          ),
        ),
        child: Listener(
          onPointerSignal: (event) {
            if (event is PointerScrollEvent) {
              _onScroll(event.scrollDelta.dy);
            }
          },
          child: ValueListenableBuilder(
            valueListenable: _scrollNormalized,
            builder: (context, value, child) => Stack(
              children: [
                Container(
                  color: const Color(0xdd030F0F),
                ),
                if (_scrollNormalized.value <= 0.2)
                  Welcome(
                    scrollValue: _scrollNormalized,
                    start: 0,
                    end: 0.2,
                  ),
                if (_scrollNormalized.value > 0.2 &&
                    _scrollNormalized.value <= 0.75)
                  HeroPage(
                    scrollValue: _scrollNormalized,
                    start: 0.2,
                    end: 0.75,
                  ),
                if (_scrollNormalized.value > 0.75 &&
                    _scrollNormalized.value <= 1)
                  Center(
                    child: Text(
                      'Localizando sistema "Hisnaider R.C"...',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                if (_scrollNormalized.value > 0.65 &&
                    _scrollNormalized.value <= 0.95)
                  AboutMePage(
                    scrollValue: _scrollNormalized,
                    start: 0.65,
                    end: 0.95,
                  ),
                // Transform.scale(
                //   scale: 0.01,
                //   child: SizedBox(
                //     height: MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     child: StarSystemPage(),
                //   ),
                // ),
                // ListView(
                //   children: [
                //   ],
                // ),

                // Center(child: SvgPicture.asset(Assets.lensFlare)),
                //StarSystemPage()
                Text('$_scrollDy\n${_scrollNormalized.value}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
