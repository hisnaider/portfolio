import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_system_config.dart';
import 'package:portfolio/src/features/orbiting_system/layers/UI/widgets/contact_section.dart';
import 'package:portfolio/src/features/orbiting_system/layers/UI/widgets/side_menu.dart';

class UiLayer extends StatelessWidget {
  const UiLayer({super.key, required this.config});
  final ValueNotifier<StarSystemConfig> config;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<StarSystemConfig>(
        valueListenable: config,
        builder: (context, value, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              IgnorePointer(
                ignoring: value.showContact,
                child: AnimatedOpacity(
                  opacity: value.showContact ? 0 : 1,
                  duration: Duration(milliseconds: 250),
                  child: SideMenu(
                    config: value,
                    onButtonPressed: (newConfig) => config.value = newConfig,
                  ),
                ),
              ),

              ///ContactSection()
            ],
          );
        });
  }
}
