import 'dart:async';

import 'package:videogames_list_mobile/app/core/base/base_remote_source.dart';
import 'package:videogames_list_mobile/app/data/model/user_data_response.dart';
import 'package:videogames_list_mobile/app/network/api_end_points.dart';
import 'package:videogames_list_mobile/app/network/dio_provider.dart';

///
abstract class IUsersDataProvider {
  /// Fetching users list from server
  Future<List<UserDataResponse>> getUsers();
}

///
class UsersDataProvider extends BaseRemoteSource implements IUsersDataProvider {
  @override
  Future<List<UserDataResponse>> getUsers() {
    var endpoint = "${DioProvider.baseUrl}${APIEndPoints.users.path}";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          (response.data as List<dynamic>)
              .map((dynamic e) =>
                  UserDataResponse.fromJson(e as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }
}
