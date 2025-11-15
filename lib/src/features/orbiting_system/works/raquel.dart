import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/text_list.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';

class Raquel extends StatefulWidget {
  const Raquel({super.key});

  @override
  State<Raquel> createState() => _RaquelState();
}

class _RaquelState extends State<Raquel> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(Assets.raquel),
        ),
        Text(
          'Raquel Menopausa é um aplicativo gratuito que ajuda mulheres a navegar pelo climatério com mais informação, acolhimento e autonomia. Mais do que um app, é um projeto que coloca tecnologia a serviço da saúde e do bem-estar feminino, promovendo uma jornada de autoconhecimento e conexão.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nO que o Raquel Menopausa oferece:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const TextList(
          leadingIcon: Icon(
            Icons.circle,
            size: 6,
          ),
          children: [
            TextSpan(
                text:
                    'Identificação do estágio do climatério, com base em respostas e sintomas, oferecendo um retrato claro do seu estado hormonal e físico;'),
            TextSpan(
                text:
                    'Comunidade exclusiva, para trocar experiências, receber apoio e sentir-se compreendida por quem está passando pelo mesmo momento;'),
            TextSpan(
                text:
                    'Conteúdos científicos e informativos sobre saúde, bem-estar e estilo de vida durante o climatério;'),
            TextSpan(
                text:
                    'Diário de sintomas e hábitos, que ajuda a monitorar padrões individuais e facilita o acompanhamento médico.'),
          ],
        ),
        Text(
          '\nMinha atuação no projeto:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          'Atuei como pesquisador júnior, liderando tecnicamente o desenvolvimento mobile do projeto. Fui o mais experiente do grupo, o que me permitiu não só tomar decisões críticas de arquitetura e tecnologia, mas também orientar e ajudar os colegas sempre que necessário, garantindo que todo o time evoluísse junto.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nPrincipais responsabilidades e entregas:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const TextList(
          leadingIcon: Icon(
            Icons.circle,
            size: 6,
          ),
          children: [
            TextSpan(
                text:
                    'Definição e implementação da Clean Architecture, garantindo um código desacoplado, testável e sustentável, adaptado às demandas esperados de um app da área da saúde;'),
            TextSpan(
                text:
                    'Gestão avançada de estado com GetX, trabalhando com modularização, injeção de dependências e navegação robusta para fluxos complexos;'),
            TextSpan(
                text:
                    'Desenvolvimento de funcionalidades críticas e componentes performáticos, assegurando uma UX fluida e uma lógica de negócios confiável;'),
            TextSpan(
                text:
                    'Atuação ativa na evolução técnica da equipe, promovendo discussões sobre padrões, boas práticas e ajudando colegas na adoção da arquitetura limpa e no uso das ferramentas do projeto.'),
          ],
        ),
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
        ),
        Text(
          '\nLink:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const TextList(
          leadingIcon: Icon(
            Icons.circle,
            size: 6,
          ),
          children: [
            TextSpan(text: 'Google Play: ', children: [
              TextSpan(
                  text:
                      'https://play.google.com/store/apps/details?id=com.raquelmenopausa.raquelapp&hl=pt_BR',
                  style: TextStyle(
                    color: MyColors.primary,
                  )),
            ]),
          ],
        ),
      ],
    );
  }
}
