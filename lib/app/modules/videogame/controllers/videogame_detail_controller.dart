import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/base/base_controller.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_game_detail_response.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/network/exceptions/base_exception.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class VideoGameDetailController extends BaseController
    with StateMixin<PlaystationGameDetailResponse> {
  /// Games data repository
  final IGamesDataRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchPlayStationGameDetail();
  }

  /// Fetching playstation game detail
  Future<void> fetchPlayStationGameDetail() async {
    String gameID = Get.parameters['gameId'] ?? '';

    if (gameID.isEmpty) {
      change(null,
          status: RxStatus.error((Get.context == null)
              ? ""
              : S.of(Get.context as BuildContext).unavailableGameId));
      return;
    }

    callDataService(_repository.getPlaystationGameDetails(gameID),
        onNetworkError: (String message) =>
            change(null, status: RxStatus.error(message)),
        onStart: () => change(null, status: RxStatus.loading()),
        onSuccess: (PlaystationGameDetailResponse response) {
          change(response, status: RxStatus.success());
        },
        onError: (Exception exception) => change(null,
            status: RxStatus.error((exception as BaseException).message)));
  }

  String getGenres() {
    return state?.genres?.join(', ') ?? '';
  }
}
