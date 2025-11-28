import 'package:portfolio/core/commons/entities/works.dart';
import 'package:portfolio/core/commons/enum/skills_enum.dart';
import 'package:portfolio/src/main_page/views/star_system/works/formy.dart';
import 'package:portfolio/src/main_page/views/star_system/works/pinguim.dart';
import 'package:portfolio/src/main_page/views/star_system/works/raquel.dart';

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

  static Map<String, Work> allWorks = {
    'Pinguim': const Work(
        companyName: 'iTec/FURG-Embrapii',
        image:
            'https://media.licdn.com/dms/image/v2/D4D0BAQGo04vyG7_IIA/company-logo_200_200/company-logo_200_200/0/1723813186085/unidade_furg_embrapii_centro_de_robotica_e_ciencia_de_dados_logo?e=1756944000&v=beta&t=FFHZWLnULukg9LNncD5effHZGPYg43BXXanMMNCcqIA',
        role: 'Pesquisador Júnior',
        competences: [
          'Flutter',
          'Dart',
          'Clean Arch”',
          'Bloc',
          'Consumo de API',
          'Liderança',
          'Proatividade',
          'Aprendizado contínuo',
          'Empatia técnica'
        ],
        page: Pinguim()),
    'Raquel Menopausa': const Work(
        companyName: 'iTec/FURG-Embrapii',
        image:
            'https://media.licdn.com/dms/image/v2/D4D0BAQGo04vyG7_IIA/company-logo_200_200/company-logo_200_200/0/1723813186085/unidade_furg_embrapii_centro_de_robotica_e_ciencia_de_dados_logo?e=1756944000&v=beta&t=FFHZWLnULukg9LNncD5effHZGPYg43BXXanMMNCcqIA',
        role: 'Pesquisador Júnior',
        competences: [
          'Flutter',
          'Dart',
          'Clean Arch”',
          'GetX',
          'Consumo de API',
          'Liderança',
          'Proatividade',
          'Aprendizado contínuo',
          'Empatia técnica'
        ],
        page: Raquel()),
    'Formy': const Work(
        companyName: 'Projeto pessoal',
        image: '',
        role: 'Desenvolvedor Flutter Open Source',
        competences: [
          'Flutter',
          'Dart',
          'Proatividade',
          'Aprendizado contínuo'
        ],
        page: Formy()),
  };
}
//     const Work(
//       companyName:
//           'iTec/FURG-Embrapii',
//       image:
//           'https://media.licdn.com/dms/image/v2/D4D0BAQGo04vyG7_IIA/company-logo_200_200/company-logo_200_200/0/1723813186085/unidade_furg_embrapii_centro_de_robotica_e_ciencia_de_dados_logo?e=1756944000&v=beta&t=FFHZWLnULukg9LNncD5effHZGPYg43BXXanMMNCcqIA',
//       role: 'Pesquisador Júnior',
//       competences: [
//         'Flutter',
//         'Dart',
//         'Clean Arch”',
//         'Bloc',
//         'Consumo de API',
//         'Liderança',
//         'Proatividade',
//         'Aprendizado contínuo',
//         'Empatia técnica'
//       ],
//     ),
//     const Work(
//       companyName:
//           'iTec/FURG-Embrapii',
//       image:
//           'https://media.licdn.com/dms/image/v2/D4D0BAQGo04vyG7_IIA/company-logo_200_200/company-logo_200_200/0/1723813186085/unidade_furg_embrapii_centro_de_robotica_e_ciencia_de_dados_logo?e=1756944000&v=beta&t=FFHZWLnULukg9LNncD5effHZGPYg43BXXanMMNCcqIA',
//       role: 'Pesquisador Júnior',
//       competences: [
//         'Flutter',
//         'Dart',
//         'Clean Arch”',
//         'GetX',
//         'Consumo de API',
//         'Liderança',
//         'Proatividade',
//         'Aprendizado contínuo',
//         'Empatia técnica'
//       ],
//     ),
//     const Work(
//       image: '',
//       role: 'Desenvolvedor Flutter Open Source',
//       competences: ['Flutter', 'Dart', 'Proatividade', 'Aprendizado contínuo'],
//     ),
//     const Work(
//       image: '',
//       role: 'Desenvolvedor Mobile Flutter - Projeto Pessoal',
//       competences: ['Flutter', 'Dart', 'Proatividade', 'Aprendizado contínuo'],
//     ),
//   ];
// }
