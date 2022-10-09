import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_detail_controller.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';

import '../../../mock_games_data_repository.dart';
import '../../../mock_network_controller.dart';

void main() {
  BindingsBuilder bindingsBuilder = BindingsBuilder<dynamic>(() {
    Get.lazyPut<INetworkInfoProvider>(() => MockNetworkController());

    Get.lazyPut<IGamesDataRepository>(() => MockGamesDataRepository());
    Get.lazyPut(() => VideoGameDetailController());
  });

  test('Test Binding', () {
    expect(Get.isPrepared<VideoGameDetailController>(), false);
    bindingsBuilder.builder();
    expect(Get.isPrepared<VideoGameDetailController>(), true);
  });

  test('Test controller with ID', () async {
    Get.parameters = <String, String>{
      VideoGameDetailController.paramGameID: "1234"
    };
    bindingsBuilder.builder();
    VideoGameDetailController controller =
        Get.find<VideoGameDetailController>();

    expect(controller.initialized, true);
    expect(controller.status.isLoading, true);

    await Future<dynamic>.delayed(const Duration(seconds: 1));

    if (controller.status.isError) {
      expect(controller.state, null);
    }

    if (controller.status.isSuccess) {
      expect(controller.state, isNotNull);

      await controller.fetchPlayStationGameDetail();

      await Future<dynamic>.delayed(const Duration(seconds: 1));

      expect(controller.getGenres(), isNotEmpty);
    }
  });
}
