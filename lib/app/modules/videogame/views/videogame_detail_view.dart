import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:videogames_list_mobile/app/core/utils/date_util.dart';
import 'package:videogames_list_mobile/app/core/utils/helper.dart';
import 'package:videogames_list_mobile/app/core/values/app_images.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/core/values/text_styles.dart';
import 'package:videogames_list_mobile/app/core/widgets/animation_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/custom_circle_icon_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/draggable_sheet_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/error_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/loading_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_detail_controller.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_platforms_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/metacratic_view.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class VideoGameDetailView extends GetView<VideoGameDetailController> {
  const VideoGameDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: controller.obx(
        (state) => Container(
          decoration: BoxDecoration(
            image: (state?.backgroundImageAdditional?.isEmpty ?? true)
                ? null
                : DecorationImage(
                    image: CachedNetworkImageProvider(
                        state!.backgroundImageAdditional!),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (1 - 0.63),
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          imageUrl: state?.backgroundImageAdditional ??
                              state?.backgroundImage ??
                              '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(AppValues.paddingDefault),
                          child: CustomCircleIconView(
                            onTap: () => Get.back<dynamic>(),
                            child: const Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  DraggableSheetView(
                    child: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppValues.paddingDouble),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: AnimationView(
                                delay: const Duration(
                                    microseconds: AppValues.initialAnimation),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: kElevationToShadow[8],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppValues.radiusDefault),
                                    child: AspectRatio(
                                      aspectRatio:
                                          AppValues.smallImageAspectRatio,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              state?.backgroundImage ?? '',
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  AppImages.placeholderImage,
                                                  fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: AppValues.paddingDouble),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AnimationView(
                                      delay: const Duration(
                                          microseconds:
                                              AppValues.delayedAnimation),
                                      child: Text(
                                        state?.name ?? '',
                                        style: heading.copyWith(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimationView(
                                      delay: const Duration(
                                          microseconds:
                                              AppValues.delayedAnimation),
                                      child: Text(
                                        DateUtil.getDefaultFormattedDate(
                                            state?.released),
                                        style: heading.copyWith(
                                          color: Colors.white.withOpacity(.9),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimationView(
                                      delay: const Duration(
                                          microseconds:
                                              AppValues.delayedAnimation),
                                      child: Text(
                                        controller.getGenres(),
                                        style: mediumText.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimationView(
                                      delay: const Duration(
                                          microseconds:
                                              AppValues.delayedAnimation),
                                      child: Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: state?.rating?.toDouble() ??
                                                0.0,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: AppValues.iconSizeDefault,
                                            direction: Axis.horizontal,
                                          ),
                                          Text(
                                            S.of(context).rating(
                                                state?.rating?.toDouble() ??
                                                    0.0),
                                            style: mediumText.copyWith(
                                              color: Colors.amber,
                                              letterSpacing: 1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimationView(
                                      delay: const Duration(
                                          microseconds:
                                              AppValues.delayedAnimation),
                                      child: MetacraticView(
                                        metacriticScore:
                                            state?.metacritic?.toInt() ?? 0,
                                        metacriticScoreColor:
                                            Helper.metacriticScoreColor(
                                                state?.metacritic?.toInt() ??
                                                    0),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (state?.descriptionRaw?.isNotEmpty ?? false)
                        Padding(
                          padding:
                              const EdgeInsets.all(AppValues.paddingDouble),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AnimationView(
                                  delay: const Duration(
                                      microseconds:
                                          AppValues.animationMicroDelay800),
                                  child: Text(S.of(context).overview,
                                      style: heading.copyWith(
                                          color: Colors.white))),
                              const SizedBox(height: 10),
                              AnimationView(
                                delay: const Duration(
                                    microseconds:
                                        AppValues.animationMicroDelay1000),
                                child: ReadMoreText(
                                  state!.descriptionRaw!,
                                  trimLines: 6,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText:
                                      S.of(context).more.toLowerCase(),
                                  trimExpandedText:
                                      S.of(context).less.toLowerCase(),
                                  style:
                                      mediumText.copyWith(color: Colors.white),
                                  moreStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      if (state?.platforms?.isNotEmpty ?? false)
                        GamePlatformsView(
                          platforms: state!.platforms!,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        onLoading: const LoadingView(),
        onError: (error) => ErrorView(
          messageTitle: S.of(context).somethingWentTitle,
          messageDesc: error ?? S.of(context).unavailableGameId,
          errorCTA: S.of(context).retry,
          containerHeight: MediaQuery.of(context).size.height / 1.5,
          onErrorCTAClicked: controller.onInit,
        ),
        onEmpty: Center(
          child: Text(S.of(context).noDataFound,
              style: Theme.of(context).textTheme.headline3),
        ),
      ),
    );
  }
}
