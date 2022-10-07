import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_detail_controller.dart';

class VideoGameDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoGameDetailController());
  }
}
