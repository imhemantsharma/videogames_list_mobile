import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/data/local/preference/preference_manager.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPreferenceManager>(
      () => PreferenceManager(),
      fenix: true,
    );
  }
}
