import 'package:videogames_list_mobile/app/data/model/user_data_response.dart';
import 'package:videogames_list_mobile/app/data/provider/users_data_provider.dart';

///
class UsersDataRepository implements IUsersDataRepository {
  ///
  UsersDataRepository({required this.provider});

  ///
  final IUsersDataProvider provider;

  @override
  Future<List<UserDataResponse>?> getUsers() async {
    return await provider.getUsers();
  }
}

///
abstract class IUsersDataRepository {
  ///
  Future<List<UserDataResponse>?> getUsers();
}
