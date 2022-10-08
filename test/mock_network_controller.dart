import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';

class MockNetworkController implements INetworkInfoProvider {
  @override
  RxBool get isNetworkConnected => true.obs;
}

class MockNetworkControllerDisconnected implements INetworkInfoProvider {
  @override
  RxBool get isNetworkConnected => false.obs;
}
