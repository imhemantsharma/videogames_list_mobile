
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_controller.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';

import '../../../mock_games_data_repository.dart';
import '../../../mock_network_controller.dart';

void main() {
  BindingsBuilder bindingsBuilder = BindingsBuilder<dynamic>(() {
    Get.lazyPut<INetworkInfoProvider>(() => MockNetworkController());

    Get.lazyPut<IGamesDataRepository>(() => MockGamesDataRepository());
    Get.lazyPut(() => VideoGameController());
  });

  test('Test Binding', () {
    expect(Get.isPrepared<VideoGameController>(), false);
    bindingsBuilder.builder();
    expect(Get.isPrepared<VideoGameController>(), true);
  });

  test('Test controller', () async {
    bindingsBuilder.builder();
    VideoGameController controller = Get.find<VideoGameController>();

    expect(controller.initialized, true);
    expect(controller.status.isLoading, true);
    expect(controller.pageNumber, 1);

    await Future<dynamic>.delayed(const Duration(seconds: 1));

    if (controller.status.isError) {
      expect(controller.state, null);
    }

    if (controller.status.isSuccess) {
      expect(controller.state!.isEmpty, false);

      expect(controller.pageNumber, 2);

      await controller.fetchPlayStationGames();

      await Future<dynamic>.delayed(const Duration(seconds: 1));

      if (!controller.isPaginationLoading.value && !controller.isPaginationError.value && !controller.isPaginationLastPage) {
        expect(controller.pageNumber, 3);
      }
    }
  });
}
