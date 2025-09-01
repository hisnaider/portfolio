import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/primary_button.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(
                text: "I'm ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
                children: const [
              TextSpan(
                  text: 'Hisnaider R. Campello',
                  style: TextStyle(fontWeight: FontWeight.w800))
            ])),
        Text(
          'MOBILE DEVELOPER',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Desenvolvedor mobile apaixonado por performance, UX e código limpo. Especialista em Flutter, com background em design e Figma.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.file_download_outlined),
                  Text(
                    'Ver currículo',
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            PrimaryButton(
              onPressed: () {},
              text: 'Entrar em contato',
            )
          ],
        )
      ],
    );
  }
}
