import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/commons/widgets/down_hint.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/features/orbiting_system/entities/celestial_body.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/orbiting_system_widget.dart';
import 'package:portfolio/src/views/about_me/about_me_page.dart';
import 'package:portfolio/src/views/all_works/all_works_page.dart';
import 'package:portfolio/src/views/hero_page/hero_page.dart';
import 'package:portfolio/src/views/highlight/highlight_page.dart';
import 'package:portfolio/src/views/star_system/star_system_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
        child: Stack(
          children: [
            // Container(
            //   color: const Color(0xdd030F0F),
            //   child: ListView(
            //     children: [
            //       HeroPage(),
            //       DownHint(text: 'Sobre mim'),
            //       AboutMePage(),
            //     ],
            //   ),
            // ),
            // Center(child: SvgPicture.asset(Assets.lensFlare)),
            StarSystemPage()
          ],
        ),
      ),
    );
  }
}
