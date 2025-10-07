import 'package:flutter/material.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_system_config.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/work_desc.dart';
import 'package:portfolio/src/views/highlight/widgets/raquel/raquel_body.dart';

class UserInterfaceLayer extends StatelessWidget {
  const UserInterfaceLayer({super.key, required this.config});
  final StarSystemConfig config;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: config.selectedBody != null
          ? WorkDesc(
              celestialBody: config.selectedBody!,
              backButton: () {},
              child: RaquelBody(),
            )
          : SizedBox.shrink(),
    );
  }
}
