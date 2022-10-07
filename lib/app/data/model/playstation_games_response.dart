import 'playstation_game_data.dart';

class PlaystationGamesResponse {
  PlaystationGamesResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.userPlatforms,
  });

  PlaystationGamesResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((dynamic v) {
        results?.add(PlaystationGameData.fromJson(v));
      });
    }
    userPlatforms = json['user_platforms'];
  }
  num? count;
  String? next;
  dynamic previous;
  List<PlaystationGameData>? results;
  bool? userPlatforms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['user_platforms'] = userPlatforms;
    return map;
  }
}
