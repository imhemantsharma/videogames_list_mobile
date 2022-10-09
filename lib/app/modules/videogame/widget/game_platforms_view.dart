import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/core/values/text_styles.dart';
import 'package:videogames_list_mobile/app/core/widgets/animation_view.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_game_platform.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class GamePlatformsView extends StatelessWidget {
  const GamePlatformsView({
    super.key,
    required this.platforms,
  });

  final List<PlaystationGamePlatform> platforms;

  @override
  Widget build(BuildContext context) {
    return AnimationView(
      delay: const Duration(microseconds: AppValues.animationMicroDelay1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppValues.paddingDouble),
            child: Text(
              S.of(context).platforms,
              style: heading.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: platforms
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(AppValues.paddingDouble),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppValues.radiusDefault),
                                  color: Colors.grey.shade900,
                                  boxShadow: kElevationToShadow[8],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppValues.radiusDefault),
                                  child: CachedNetworkImage(
                                    imageUrl: item.imageBackground ?? '',
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 200,
                                  ),
                                )),
                            const SizedBox(height: 8),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 200,
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                item.name ?? '',
                                maxLines: 2,
                                style: mediumText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
