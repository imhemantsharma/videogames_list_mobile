import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/utils/date_util.dart';
import 'package:videogames_list_mobile/app/core/utils/helper.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/core/widgets/error_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/loading_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/pagination_error_view.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_game_data.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_controller.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_card_view.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class VideoGameView extends GetView<VideoGameController> {
  const VideoGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(S.of(context).appTitle),
      ),
      body: controller.obx(
        (state) => NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isPaginationLastPage &&
                !controller.isPaginationLoading.value &&
                !controller.isPaginationError.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.fetchPlayStationGames();
            }

            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              controller.onInit();
            },
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.symmetric(
                vertical: AppValues.paddingDouble,
              ),
              physics: const BouncingScrollPhysics(),

              /// Added +1 for the loader item at the bottom
              itemCount: (state?.length ?? 0) == 0 ? 0 : (state!.length + 1),
              itemBuilder: (BuildContext context, int index) {
                if (index == state!.length) {
                  return Obx(() => (controller.isPaginationLoading.value)
                      ? const LoadingView()
                      : (controller.isPaginationError.value)
                          ? PaginationErrorView(
                              onTap: () => controller.fetchPlayStationGames())
                          : SizedBox(
                              height: controller.isPaginationLastPage
                                  ? 0

                                  /// set height 0 when reached to the last page
                                  : AppValues.paginationBottomSpaceSize));
                }

                PlaystationGameData data = state[index];
                return GameCardView(
                  name: data.name,
                  posterUrl: data.backgroundImage,
                  date: DateUtil.getDefaultFormattedDate(data.released),
                  rating: data.rating?.toDouble(),
                  metacriticScore: data.metacritic?.toInt(),
                  metacriticScoreColor: Helper.metacriticScoreColor(
                      data.metacritic?.toInt() ?? 0),
                  onCardTap: () {
                    controller.onCardClick(data);
                  },
                );
              },
            ),
          ),
        ),
        onLoading: const LoadingView(),
        onError: (error) => ErrorView(
          messageTitle: S.of(context).somethingWentTitle,
          messageDesc: error,
          errorCTA: S.of(context).retry,
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
