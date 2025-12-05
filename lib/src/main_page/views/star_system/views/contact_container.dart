import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer({
    super.key,
    required this.isVertical,
  });
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(64),
      color: const Color(0xff0C0C0E),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('CONTATO', style: Theme.of(context).textTheme.titleLarge),
          Text(
            'Seu proximo grande projeto começa aqui. Entre em contato',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),
          Flex(
            direction: isVertical ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '''Gostou do meu trabalho ou quer saber mais sobre mim?
Vamos bater um papo! Me chama por onde preferir''',
                textAlign: isVertical ? TextAlign.center : TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20),
              ),
              if (!isVertical)
                const SizedBox(
                  height: 200,
                  child: VerticalDivider(
                    width: 83,
                    thickness: 1,
                    color: Colors.white,
                  ),
                )
              else
                SizedBox(height: 24),
              Flexible(
                flex: 1,
                fit: isVertical ? FlexFit.loose : FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ContactLink(
                      asset: Assets.email,
                      text: 'hisnaider.dev@gmail.com',
                      onPressed: () {},
                    ),
                    _ContactLink(
                      asset: Assets.github,
                      text: 'hisnaider ',
                      onPressed: () {
                        print('github.com/hisnaider');
                      },
                    ),
                    _ContactLink(
                      asset: Assets.linkedin,
                      text: 'Hisnaider R. Campello',
                      onPressed: () {
                        print('linkedin.com/in/hisnaider-r-campello-3a420698');
                      },
                    ),
                    _ContactLink(
                      asset: Assets.phone,
                      text: '+55 53 99128-0480',
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 48),
          SvgPicture.asset(Assets.myLogoSvg, height: 25)
        ],
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink(
      {required this.asset, required this.text, required this.onPressed});
  final String asset;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5))),
              child: Text(
                text,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20, color: MyColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
