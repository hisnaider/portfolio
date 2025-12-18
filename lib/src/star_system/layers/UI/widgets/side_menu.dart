import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/analytics.dart';
import 'package:portfolio/src/star_system/entities/star_system_config.dart';

class SideMenu extends StatelessWidget {
  const SideMenu(
      {super.key, required this.config, required this.onButtonPressed});
  final StarSystemConfig config;
  final Function(StarSystemConfig newConfig) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: MyColors.backgroud.withOpacity(0.75),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _UiButton(
                  iconAssetOn: Assets.orbitOn,
                  iconAssetOff: Assets.orbitOff,
                  isActivate: config.showOrbitLine,
                  onPressed: (bool newValue) {
                    onButtonPressed(config.copyWith(showOrbitLine: newValue));
                    Analytics.instance.getTogglesEvent(
                        action: newValue ? 'orbit_shown' : 'orbit_hidden');
                  }),
              const SizedBox(height: 10),
              _UiButton(
                  iconAssetOn: Assets.nameOn,
                  iconAssetOff: Assets.nameOff,
                  isActivate: config.showPlanetNames,
                  onPressed: (bool newValue) {
                    onButtonPressed(config.copyWith(showPlanetNames: newValue));
                    Analytics.instance.getTogglesEvent(
                        action: newValue
                            ? 'planet_name_shown'
                            : 'planet_name_hidden');
                  }),
              const SizedBox(height: 10),
              _UiButton(
                  iconAssetOn: Assets.selectOn,
                  iconAssetOff: Assets.selectOff,
                  isActivate: config.showSelectionIndicator,
                  onPressed: (bool newValue) {
                    onButtonPressed(
                        config.copyWith(showSelectionIndicator: newValue));
                    Analytics.instance.getTogglesEvent(
                        action:
                            newValue ? 'indicator_shown' : 'indicator_hidden');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _UiButton extends StatelessWidget {
  const _UiButton(
      {required this.iconAssetOn,
      required this.iconAssetOff,
      required this.isActivate,
      required this.onPressed});
  final String iconAssetOn;
  final String iconAssetOff;
  final bool isActivate;
  final Function(bool newValue) onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(!isActivate),
      icon: AnimatedCrossFade(
          alignment: Alignment.centerLeft,
          firstChild: _svg(iconAssetOn),
          secondChild: _svg(iconAssetOff),
          crossFadeState:
              isActivate ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 250)),
    );
  }

  Widget _svg(String value) => SvgPicture.asset(value, height: 50);
}
