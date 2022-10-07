import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/core/values/text_styles.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/metacratic_view.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({
    Key? key,
    this.poster,
    this.name,
    this.date,
    this.rating,
    this.metacriticScore,
    this.metacriticScoreColor,
    this.onCardTap,
  }) : super(key: key);

  final String? poster;
  final String? name;
  final String? date;
  final double? rating;
  final int? metacriticScore;
  final Color? metacriticScoreColor;
  final VoidCallback? onCardTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: InkWell(
        onTap: onCardTap,
        child: Material(
          type: MaterialType.card,
          elevation: AppValues.elevationDefault,
          borderRadius: BorderRadius.circular(AppValues.radiusDefault),
          child: Stack(
            children: [
              Row(
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppValues.radiusDefault),
                          bottomLeft: Radius.circular(AppValues.radiusDefault)),
                      child: AspectRatio(
                        aspectRatio: AppValues.smallImageAspectRatio,
                        child: CachedNetworkImage(
                          imageUrl: poster ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                              'assets/images/img_placeholder.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(AppValues.paddingDouble),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: heading,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            date ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: mediumText,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: rating ?? 0.0,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: AppValues.iconSizeDefault,
                                direction: Axis.horizontal,
                              ),
                              Text(
                                '  $rating/5',
                                style: mediumText.copyWith(
                                  color: Colors.amber,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              MetacraticView(
                  metacriticScore: metacriticScore ?? 0,
                  metacriticScoreColor: metacriticScoreColor)
            ],
          ),
        ),
      ),
    );
  }
}
