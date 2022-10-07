import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/bindings/local_source_bindings.dart';
import 'package:videogames_list_mobile/app/bindings/remote_bindings.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<INetworkInfoProvider>(() => NetworkController(), fenix: true);
    RemoteBindings().dependencies();
    LocalSourceBindings().dependencies();
  }
}
