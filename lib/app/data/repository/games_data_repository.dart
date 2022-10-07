import 'package:videogames_list_mobile/app/data/model/game_query_payload.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_game_detail_response.dart';
import 'package:videogames_list_mobile/app/data/model/playstation_games_response.dart';
import 'package:videogames_list_mobile/app/data/provider/games_data_provider.dart';

///
class GamesDataRepository implements IGamesDataRepository {
  ///
  GamesDataRepository({required this.provider});

  ///
  final IGamesDataProvider provider;

  @override
  Future<PlaystationGamesResponse> getPlaystationGames(
      GameQueryPayload queryPayload) async {
    return await provider.getPlaystationGames(queryPayload);
  }

  @override
  Future<PlaystationGameDetailResponse> getPlaystationGameDetails(
      String gameId) async {
    return await provider.getPlaystationGameDetails(gameId);
  }
}

///
abstract class IGamesDataRepository {
  ///
  Future<PlaystationGamesResponse> getPlaystationGames(
      GameQueryPayload queryPayload);

  ///
  Future<PlaystationGameDetailResponse> getPlaystationGameDetails(
      String gameId);
}
