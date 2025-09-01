import 'package:flutter/material.dart';
import 'package:flutter_formy/flutter_formy.dart';
import 'package:flutter_formy/flutter_formy_generic_validators.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/commons/widgets/primary_button.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';

class RaquelSideBody extends StatefulWidget {
  RaquelSideBody({super.key});

  @override
  State<RaquelSideBody> createState() => _RaquelSideBodyState();
}

class _RaquelSideBodyState extends State<RaquelSideBody> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Image.asset(Assets.raquel),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 500,
          child: PageView.builder(
            controller: pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Image.asset(
                  'assets/images/raquel/raquel_print_${index + 1}.jpg');
            },
          ),
        )
      ],
    );
  }
}
