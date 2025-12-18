import 'package:flutter/material.dart';
import 'package:portfolio/core/route/app_router.dart';
import 'package:portfolio/core/route/route_paths.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/analytics.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/scroll_section/scroll_section.dart';
import 'package:portfolio/src/star_system/star_system_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _booted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_booted) return;
    _booted = true;

    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final String route = _getInitialRoute();
    print(route);
    await _preloadAssets(route);
    _initServices();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(_buildRoute(route));
  }

  Future<void> _preloadAssets(String route) async {
    final List<String> images = [];
    final List<String> svgs = [];
    if (route == '/') {
      images.addAll([
        Assets.universe,
        Assets.firstRecord,
        Assets.photo,
        Assets.myLogo,
      ]);
      svgs.addAll([
        Assets.figma,
        Assets.dart,
        Assets.flutter,
        Assets.cleanArchitecture,
      ]);
    } else if (route.startsWith('/system')) {
      svgs.addAll([
        Assets.myLogo,
        Assets.myLogoSvg,
        Assets.formy,
        Assets.email,
        Assets.github,
        Assets.linkedin,
        Assets.phone,
        Assets.nameOn,
        Assets.nameOff,
        Assets.orbitOn,
        Assets.orbitOff,
        Assets.selectOn,
        Assets.selectOff,
        Assets.moveCameraMouse,
        Assets.zoomCameraMouse,
        Assets.selectBodyMouse,
        Assets.moveCameraTouch,
        Assets.zoomCameraTouch,
        Assets.selectBodyTouch,
      ]);
    }
    await Future.wait(images.map((e) => precacheImage(AssetImage(e), context)));
    for (final path in svgs) {
      final SvgAssetLoader loader = SvgAssetLoader(path);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }

  Future<void> _initServices() async {
    Analytics.instance.init(Theme.of(context).platform);
  }

  String _getInitialRoute() {
    final route = WidgetsBinding.instance.platformDispatcher.defaultRouteName;
    if (route.startsWith(RoutePaths.starSystem)) {
      return route;
    }

    return RoutePaths.inital;
  }

  PageRoute _buildRoute(String route) {
    return AppRouter.build(route);
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: MyColors.backgroud,
      body: Center(
        child: Image.asset(
          Assets.myLogo,
          width: maxWidth.clamp(0, 500),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
