import 'dart:async';

import 'package:videogames_list_mobile/app/core/base/base_remote_source.dart';
import 'package:videogames_list_mobile/app/data/model/game_query_payload.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_game_detail_response.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_games_response.dart';
import 'package:videogames_list_mobile/app/network/api_end_points.dart';
import 'package:videogames_list_mobile/app/network/dio_provider.dart';

///
abstract class IGamesDataProvider {
  /// Fetching playstation games
  Future<PlaystationGamesResponse> getPlaystationGames(
      GameQueryPayload queryPayload);

  /// Fetching playstation game details
  Future<PlaystationGameDetailResponse> getPlaystationGameDetails(
      String gameId);
}

///
class GamesDataProvider extends BaseRemoteSource implements IGamesDataProvider {
  @override
  Future<PlaystationGamesResponse> getPlaystationGames(
      GameQueryPayload queryPayload) {
    var endpoint =
        "${DioProvider.baseUrl}${APIEndPoints.playstationGames.path}";
    var dioCall = dioClient.get(
      endpoint,
      queryParameters: queryPayload.toJson(),
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => PlaystationGamesResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PlaystationGameDetailResponse> getPlaystationGameDetails(
      String gameId) {
    var endpoint =
        "${DioProvider.baseUrl}${APIEndPoints.playstationGameDetail.path.replaceFirst('{gameId}', gameId)}";
    var dioCall = dioClient.get(endpoint,
        queryParameters: <String, String>{"key": DioProvider.apiKey});

    try {
      return callApiWithErrorParser(dioCall).then(
          (response) => PlaystationGameDetailResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
