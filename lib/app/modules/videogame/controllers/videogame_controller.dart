import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/base/base_controller.dart';
import 'package:videogames_list_mobile/app/data/model/game_query_payload.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_game_data.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_games_response.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/network/exceptions/base_exception.dart';
import 'package:videogames_list_mobile/app/routes/app_pages.dart';

class VideoGameController extends BaseController
    with StateMixin<List<PlaystationGameData>> {
  /// Games data repository
  final IGamesDataRepository _repository = Get.find();

  /// Init page number with 1 for fetching initial page records
  int pageNumber = 1;

  /// Pagination variables
  /// Whether pagination loading is currently displayed to the user.
  RxBool isPaginationLoading = false.obs;

  /// Whether pagination API getting error when loading next set of data
  RxBool isPaginationError = false.obs;

  /// Whether pagination reached to the last page.
  bool isPaginationLastPage = false;

  @override
  void onInit() {
    super.onInit();
    pageNumber = 1;
    fetchPlayStationGames();
  }

  /// Fetching list of top 20 playstation games initially
  /// then fetch the next set of data on pagination
  Future<void> fetchPlayStationGames() async {
    if (isPaginationLastPage) return;

    GameQueryPayload queryPayload = GameQueryPayload()..page = pageNumber;

    callDataService(_repository.getPlaystationGames(queryPayload),
        onNetworkError: (String message) =>
            updateLoadingUI(RxStatus.error(message), isError: true),
        onStart: () => updateLoadingUI(RxStatus.loading(), isLoading: true),
        onSuccess: (PlaystationGamesResponse response) {
          isPaginationLastPage = response.next == null;
          isPaginationLoading.value = false;
          isPaginationError.value = false;

          if (pageNumber == 1) {
            change(response.results,
                status: (response.results?.isEmpty ?? false)
                    ? RxStatus.empty()
                    : RxStatus.success());
          } else if (response.results?.isNotEmpty ?? false) {
            state?.addAll(response.results!);
            change(state, status: RxStatus.success());
          }

          /// increment the page for fetching the next set of data
          pageNumber++;
        },
        onError: (Exception exception) => updateLoadingUI(
            RxStatus.error((exception as BaseException).message),
            isError: true));
  }

  /// Updating UI based on the API callbacks and [pageNumber]
  void updateLoadingUI(RxStatus status, {isLoading = false, isError = false}) {
    if (pageNumber == 1) {
      change(null, status: status);
    } else {
      isPaginationLoading.value = isLoading;
      isPaginationError.value = isError;
    }
  }

  /// Handle onClick navigation
  void onCardClick(PlaystationGameData data) {
    var parameter = <String, String>{"gameId": data.id.toString()};

    Get.toNamed(Routes.gameDetail.routeName, parameters: parameter);
  }
}
