import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/data/provider/users_data_provider.dart';
import 'package:videogames_list_mobile/app/data/repository/users_data_repository.dart';

class RemoteBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUsersDataRepository>(
        () => UsersDataRepository(provider: UsersDataProvider()));
  }
}
