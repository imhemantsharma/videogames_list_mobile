import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_controller.dart';

class VideoGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoGameController());
  }
}
