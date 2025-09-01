import 'package:portfolio/core/commons/entities/works.dart';
import 'package:portfolio/core/commons/enum/skills_enum.dart';

class MyData {
  const MyData._();

  static const mainSkills = [
    SkillsEnum.flutter,
    SkillsEnum.dart,
    SkillsEnum.figma,
    SkillsEnum.cleanArchitecture,
  ];
  static const otherSkills = [
    SkillsEnum.webDevelopment,
    SkillsEnum.apiRest,
    SkillsEnum.powerAutomate,
    SkillsEnum.sharePoint,
  ];
  static const softSkills = [
    SkillsEnum.leadership,
    SkillsEnum.proactivity,
    SkillsEnum.continuousLearning,
    SkillsEnum.technicalEmpathy,
  ];

  static List<Work> allWorks = [
    const Work(
      name:
          'Projeto Pinguim - iTec/FURG-Embrapii (App Pinguim - Rede social de turismo)',
      image:
          'https://media.licdn.com/dms/image/v2/D4D0BAQGo04vyG7_IIA/company-logo_200_200/company-logo_200_200/0/1723813186085/unidade_furg_embrapii_centro_de_robotica_e_ciencia_de_dados_logo?e=1756944000&v=beta&t=FFHZWLnULukg9LNncD5effHZGPYg43BXXanMMNCcqIA',
      role: 'Pesquisador Júnior',
      shortDesc: '''
Rede social de viagens com foco em escalabilidade, performance e colaboração. 
O app foi desenvolvido com arquitetura limpa, gerenciamento eficiente de estado com Bloc e componentes altamente reativos. 
Também foram criadas automações com SharePoint e Power Automate para otimizar processos internos da organização.
      ''',
      desc: '''
Atuei como um dos membros mais experientes da equipe, sendo responsável por decisões técnicas estratégicas, definição da arquitetura do projeto e resolução de problemas complexos ao longo do desenvolvimento. Uma das minhas principais contribuições foi a implementação da Clean Architecture, o que trouxe maior escalabilidade, organização e facilidade de manutenção para a base de código — especialmente importante em um projeto de médio/longo prazo com múltiplos colaboradores.
Além do desenvolvimento técnico, desempenhei um papel ativo no crescimento do time, promovendo boas práticas, padrões arquiteturais e uso eficiente de ferramentas como Bloc para gerenciamento de estado. Participei ativamente da mentoria dos colegas, facilitando a adoção de soluções mais maduras e ajudando na evolução técnica do grupo como um todo.
Também fui responsável por desenvolver componentes altamente reativos e otimizados, garantindo que os widgets respondessem de forma precisa a mudanças de estado ou valores específicos, sempre prezando pela performance e experiência do usuário. Com isso, contribuí diretamente para a padronização do código, aumento da produtividade e elevação da qualidade geral do produto entregue.
Na etapa final do projeto, ampliei minha atuação para o desenvolvimento de soluções com foco em automação e integração de processos internos da organização. Utilizando ferramentas como SharePoint, Microsoft Lists e Power Automate, criei fluxos automatizados, realizei manipulação de dados e integrei serviços, gerando ganhos reais de eficiência operacional.
      ''',
      competences: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'Bloc',
        'Consumo de API',
        'Liderança',
        'Proatividade',
        'Aprendizado contínuo',
        'Empatia técnica'
      ],
    ),
    const Work(
      name:
          'Projeto Plena - iTec/FURG-Embrapii (App Raquel Menopausa - Saúde Feminina)',
      image:
          'https://media.licdn.com/dms/image/v2/D4D0BAQGo04vyG7_IIA/company-logo_200_200/company-logo_200_200/0/1723813186085/unidade_furg_embrapii_centro_de_robotica_e_ciencia_de_dados_logo?e=1756944000&v=beta&t=FFHZWLnULukg9LNncD5effHZGPYg43BXXanMMNCcqIA',
      role: 'Pesquisador Júnior',
      shortDesc: '''
Aplicativo de saúde voltado ao climatério feminino, com assistente virtual, diário de sintomas, comunidade e conteúdos informativos. 
O app foi desenvolvido com Clean Architecture e gerenciamento de estado com GetX, garantindo modularidade, performance e uma experiência fluida para o público-alvo.''',
      desc: '''
Atuei na linha de frente do desenvolvimento mobile de um aplicativo voltado à área da saúde, contribuindo diretamente para decisões técnicas cruciais, definição da arquitetura e implementação de funcionalidades essenciais para o funcionamento do sistema. Desde o início do projeto, tive papel estratégico na estruturação da base do código, aplicando os princípios da Clean Architecture para garantir um sistema desacoplado, escalável e fácil de manter — respeitando as demandas específicas de um ambiente sensível e com alto rigor, como o da saúde.
Assumi a responsabilidade pelo gerenciamento eficiente de estados com GetX, priorizando uma abordagem modular, com injeção de dependências clara e navegação robusta entre telas e fluxos. Isso permitiu maior controle sobre a lógica da aplicação e facilitou a testabilidade e manutenção do código.
Desenvolvi componentes altamente performáticos e funcionalidades críticas com foco na experiência do usuário, garantindo fluidez nas interações e confiabilidade na execução de processos internos sensíveis. Além disso, atuei como facilitador técnico dentro do time, promovendo discussões sobre boas práticas, padrões de arquitetura limpa e orientando colegas na adoção de soluções mais sustentáveis ao longo do projeto.
''',
      competences: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'GetX',
        'Consumo de API',
        'Liderança',
        'Proatividade',
        'Aprendizado contínuo',
        'Empatia técnica'
      ],
    ),
    const Work(
      name: 'Flutter Formy',
      image: '',
      role: 'Desenvolvedor Flutter Open Source',
      shortDesc: '''
Formy é um pacote open source para Flutter que simplifica o gerenciamento de formulários com validação e campos altamente reativos. 
Pensado para ser flexível, escalável e fácil de usar, oferece suporte a arquiteturas limpas e padrões modernos.
      ''',
      desc: '''
Desenvolvi o Formy, um pacote open source para Flutter com o objetivo de facilitar a criação e gestão de formulários complexos. 
O Formy traz validação integrada, controle de estado eficiente e campos altamente reativos, permitindo uma experiência fluida e responsiva para o usuário final. 
Desde a concepção da arquitetura core até a criação de documentação clara e exemplos práticos, trabalhei para garantir que o pacote seja flexível, escalável e compatível com arquiteturas limpas e padrões modernos de desenvolvimento. 
O resultado é uma ferramenta que ajuda desenvolvedores a construir formulários robustos e personalizáveis, reduzindo o tempo de desenvolvimento e melhorando a qualidade do código.
''',
      competences: ['Flutter', 'Dart', 'Proatividade', 'Aprendizado contínuo'],
    ),
    const Work(
      name: 'Weather App',
      image: '',
      role: 'Desenvolvedor Mobile Flutter - Projeto Pessoal',
      shortDesc: '''
Aplicativo Flutter para exibir dados meteorológicos em tempo real via OpenWeatherMap API, com busca por cidades e interface dinâmica. Projeto pessoal focado em integração de APIs e gerenciamento de estado.
      ''',
      desc: '''
Desenvolvi um aplicativo mobile em Flutter para consultar e exibir informações meteorológicas, como temperatura, umidade e condições atuais, consumindo dados da OpenWeatherMap API. 
O app permite a busca por cidades e apresenta os dados de forma dinâmica e responsiva. 
Esse foi meu primeiro projeto pessoal com Flutter, pensado para praticar e aprimorar habilidades em integração de APIs, gerenciamento de estado e construção de interfaces funcionais e atraentes.
      ''',
      competences: ['Flutter', 'Dart', 'Proatividade', 'Aprendizado contínuo'],
    ),
  ];
}
