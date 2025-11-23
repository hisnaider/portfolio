import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';

class Skill extends StatelessWidget {
  const Skill({
    super.key,
    this.image,
    required this.text,
  });
  final String? image;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontFamily: Fonts.montserrat,
            ),
      );
    }
    return SizedBox(
      width: 60,
      child: OverflowBox(
        fit: OverflowBoxFit.deferToChild,
        minWidth: 60,
        maxWidth: 100,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: const Color(0xff3E3E49),
                  borderRadius: BorderRadius.circular(90)),
              child: SvgPicture.asset(
                image!,
                colorFilter:
                    const ColorFilter.mode(MyColors.primary, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.montserrat,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
