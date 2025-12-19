import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';

class TutorialModal {
  const TutorialModal._();

  static Future<void> open(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      fullscreenDialog: true,
      barrierColor: MyColors.backgroud.withAlpha(225),
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: 'Tutorial',
      pageBuilder: (context, animation, secondaryAnimation) {
        final bool isVertical = MediaQuery.of(context).size.width <= 800;
        return IgnorePointer(
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 24,
                children: [
                  Flex(
                    direction: isVertical ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _DisplayIcon(
                        icon: Assets.moveCameraMouse,
                        isVertical: isVertical,
                        text: 'Mover camera',
                      ),
                      _DisplayIcon(
                        icon: Assets.zoomCameraMouse,
                        isVertical: isVertical,
                        text: 'Zoom in/out',
                      ),
                      _DisplayIcon(
                        icon: Assets.selectBodyMouse,
                        isVertical: isVertical,
                        text: 'Selecionar corpo celeste',
                      ),
                    ],
                  ),
                  Text(
                    'Intereja com qualquer parte da tela para fechar o tutorial',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DisplayIcon extends StatelessWidget {
  const _DisplayIcon({
    required this.text,
    required this.icon,
    required this.isVertical,
  });
  final String text;
  final String icon;

  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical ? null : 175,
      height: isVertical ? 175 : null,
      child: Flex(
        direction: isVertical ? Axis.horizontal : Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 150,
          ),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
