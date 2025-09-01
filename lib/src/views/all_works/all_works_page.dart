import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/works.dart';
import 'package:portfolio/core/commons/widgets/competence.dart';
import 'package:portfolio/core/commons/widgets/section_container.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/core/values/my_data.dart';

class AllWorksPage extends StatelessWidget {
  const AllWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Todos trabalhos/projetos',
      // subtitle:
      //     'Projetos que demonstram minha experiência e comprometimento com a qualidade.',
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: MyData.allWorks.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 1000, // Largura máxima de cada item
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          mainAxisExtent: 375, // Altura exata do item
        ),
        itemBuilder: (context, index) {
          return WorkContainer(
            work: MyData.allWorks[index],
          );
        },
      ),
    );
  }
}

class WorkContainer extends StatelessWidget {
  const WorkContainer({
    super.key,
    required this.work,
  });
  final Work work;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: MyColors.altBackgroud,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(work.image),
                  backgroundColor: MyColors.backgroud,
                  radius: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        work.name,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        work.role,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontFamily: Fonts.poppins,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: work.competences
                      .map((e) => Competence(text: e))
                      .toList()),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Text(
                work.shortDesc,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 4,
              ),
            ),
            TextButton(onPressed: () {}, child: Text('Ver mais sobre'))
          ],
        ),
      ),
    );
  }
}
