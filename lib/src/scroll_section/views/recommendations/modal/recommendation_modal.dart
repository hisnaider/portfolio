import 'package:flutter/material.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/scroll_section/views/recommendations/entity/recommendation_entity.dart';

class RecommendationModal {
  const RecommendationModal._();

  static Future<void> open(
      BuildContext context, RecommendationEntity recommendation) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      fullscreenDialog: true,
      barrierColor: Colors.black87,
      barrierLabel: recommendation.name,
      pageBuilder: (context, animation, secondaryAnimation) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: MyColors.backgroud,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      recommendation.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      recommendation.role,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontFamily: Fonts.poppins,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          recommendation.text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(height: 1.75),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            IgnorePointer(
              child: Text(
                'Toque fora do card pra fechar',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
