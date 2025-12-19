import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'dart:html' as html;

import 'package:portfolio/analytics.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer({
    super.key,
    required this.isVertical,
  });
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: const Color(0xff0C0C0E),
      child: SelectionArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white24,
              ),
              height: 10,
              width: 50,
            ),
            const SizedBox(height: 10),
            Text('CONTATO', style: Theme.of(context).textTheme.titleLarge),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
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
                      Flexible(
                        flex: 1,
                        fit: isVertical ? FlexFit.loose : FlexFit.tight,
                        child: Text(
                          '''Gostou do meu trabalho ou quer saber mais sobre mim?
Vamos bater um papo! Me chama por onde preferir''',
                          textAlign:
                              isVertical ? TextAlign.center : TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 20),
                        ),
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
                        const SizedBox(height: 24),
                      Flexible(
                        flex: 1,
                        fit: isVertical ? FlexFit.loose : FlexFit.tight,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _ContactLink(
                              asset: Assets.email,
                              text: 'hisnaider.dev@gmail.com',
                            ),
                            _ContactLink(
                              asset: Assets.github,
                              text: 'hisnaider ',
                              url: 'github.com/hisnaider',
                            ),
                            _ContactLink(
                              asset: Assets.linkedin,
                              text: 'Hisnaider R. Campello',
                              url:
                                  'linkedin.com/in/hisnaider-r-campello-3a420698',
                            ),
                            _ContactLink(
                              asset: Assets.phone,
                              text: '+55 53 99128-0480',
                              url: 'wa.me/5553991280480',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 48),
                  SvgPicture.asset(Assets.myLogoSvg, height: 25),
                  const SizedBox(height: 24),
                  const Text(
                    '''© 2025 Hisnaider Ribeiro Campello — CC BY-NC-ND 4.0. Some rights reserved''',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({required this.asset, required this.text, this.url});
  final String asset;
  final String text;
  final String? url;

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
              onPressed: () {
                if (url == null) {
                  final String uri =
                      'mailto:$text?subject=${Uri.encodeComponent("Contato via portfólio")}&body=${Uri.encodeComponent("Olá, encontrei seu portfólio e gostaria de falar com você sobre projetos, ideias ou oportunidades.")}';
                  html.window.open(uri, '_self');
                } else {
                  html.window.open('http://$url', '_blank');
                }
                Analytics.instance.getContactLinkClickedEvent(link: text);
              },
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
