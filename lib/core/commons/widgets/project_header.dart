import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';

class ProjectHeader extends StatelessWidget {
  const ProjectHeader({
    super.key,
    required this.companyName,
    required this.role,
    this.companyImage,
    this.imageBackgroundColor,
  });
  final String companyName;
  final String role;
  final String? companyImage;
  final Color? imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final isSvg = (companyImage ?? '').endsWith('svg');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          companyName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          role,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontFamily: Fonts.poppins,
              ),
        ),
      ],
    );
  }
}
