import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/data/provider/games_data_provider.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_controller.dart';

class VideoGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IGamesDataRepository>(
        () => GamesDataRepository(provider: GamesDataProvider()));
    Get.lazyPut(() => VideoGameController());
  }
}
