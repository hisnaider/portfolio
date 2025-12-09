import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/text_list.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';

class Ciex extends StatefulWidget {
  const Ciex({super.key});

  @override
  State<Ciex> createState() => _CiexState();
}

class _CiexState extends State<Ciex> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '''O Centro Interinstitucional de Observação e Previsão de Eventos Extremos (CIEX – FURG) é uma iniciativa estratégica voltada à criação e 
operação do Digital Twin Lagoa dos Patos (DT-LAGOA). O objetivo principal é implementar uma plataforma digital de alta fidelidade capaz de simular, 
monitorar e prever, em tempo real, fenômenos meteocenográficos, hidrológicos, hidrodinâmicos e de inundação que impactam a região sul do 
Rio Grande do Sul.

O projeto envolve a integração de múltiplas instituições, sensores ambientais, redes de monitoramento, supercomputação e visualização avançada, 
oferecendo informações qualificadas para Forças de Segurança, Prefeituras, Defesas Civis, pesquisadores e tomadores de decisão.
''',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nO que o Ciex oferece:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const TextList(
          leadingIcon: Icon(
            Icons.circle,
            size: 6,
          ),
          children: [
            TextSpan(text: '''Rede integrada de monitoramento,
Estações meteocenográficas, hidrológicas e geodésicas instaladas em pontos estratégicos da Lagoa dos Patos, coletando dados contínuos e de alta precisão.'''),
            TextSpan(text: '''Sistema computacional de alto desempenho. 
Infraestrutura capaz de processar modelos de previsão em tempo real (hidrodinâmicos, meteorológicos, de inundação e Séries históricas e prognósticos)'''),
            TextSpan(
                text:
                    '''Ambiente virtual integrador. Uma plataforma centralizada que reúne
dapos observacionais em tempo real, modelos numéricos, Painéis interativos
e comunicação direta com órgãos públicos'''),
            TextSpan(text: '''Video Wall Institucional. 
Área de exibição contínua de informações operacionais, gráficos, vídeos institucionais, alertas, previsões e indicadores relevantes.'''),
            TextSpan(text: '''Integração interinstitucional. 
Eventos de capacitação, alinhamento operacional e formação técnica para equipes de segurança, gestores públicos e universidades..'''),
          ],
        ),
        Text(
          '\nMinha atuação no projeto:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          '''Desenvolvi integralmente a interface do Video Wall do CIEX - DT LAGOA utilizando Flutter, 
criando uma aplicação otimizada para exibir dados e conteúdos institucionais em 
tempo real. Além de implementar os componentes visuais para gráficos, indicadores, 
e vídeos institucionais, integrei a aplicação às APIs oficiais para garantir 
atualização contínua das informações hidrodinâmicas e meteorológicas. Também 
implementei duas funcionalidades essenciais: um sistema para salvar páginas web e 
exibi-las diretamente no Video Wall, e um gerenciador de mídias que permite 
inserir, armazenar e reproduzir qualquer vídeo ou imagem dentro do aplicativo. 
Todas essas informações são persistidas localmente utilizando o banco de dados 
Isar, possibilitando operação estável e independente de rede. Construí uma 
interface modular, escalável e adequada para telas de grande formato, garantindo 
fluidez, organização e performance.''',
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
                    'Transformar os requisitos operacionais e visuais do Video Wall em uma solução funcional e robusta;'),
            TextSpan(
                text:
                    'Definir e implementar o layout completo da aplicação em Flutter;'),
            TextSpan(
                text: 'Garantir responsividade, fluidez e clareza visual;'),
            TextSpan(
                text:
                    'Integrar conteúdos institucionais como logos, vídeos e imagens;'),
            TextSpan(
                text:
                    'Desenvolver e manter o fluxo de exibição contínuo para operação 24/7;'),
            TextSpan(
                text:
                    'Realizar testes, otimizações de performance e ajustes visuais;'),
            TextSpan(
                text:
                    'Assegurar a confiabilidade da interface e a precisão das informações exibidas;'),
            TextSpan(
                text:
                    'Estruturar a aplicação para permitir expansão e inclusão de novos conteúdos no futuro.'),
          ],
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
                      'https://play.google.com/store/apps/details?id=com.Ciexmenopausa.Ciexapp&hl=pt_BR',
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
