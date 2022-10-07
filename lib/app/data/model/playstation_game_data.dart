import 'playstion_game_store.dart';
import 'playstation_game_rating.dart';
import 'playstion_game_added_by_status.dart';
import 'playstation_game_tag.dart';
import 'playstion_game_esrb_rating.dart';
import 'playstion_game_screenshots.dart';
import 'playstation_game_genre.dart';
import 'playstation_game_platform.dart';

class PlaystationGameData {
  PlaystationGameData({
    this.slug,
    this.name,
    this.playtime,
    this.platforms,
    this.stores,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.suggestionsCount,
    this.updated,
    this.id,
    this.score,
    this.clip,
    this.tags,
    this.esrbRating,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.shortScreenshots,
    this.parentPlatforms,
    this.genres,
  });

  PlaystationGameData.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    playtime = json['playtime'];
    if (json['platforms'] != null) {
      platforms = [];
      json['platforms'].forEach((dynamic v) {
        if (v['platform'] != null) {
          platforms?.add(PlaystationGamePlatform.fromJson(v['platform']));
        }
      });
    }
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((dynamic v) {
        if (v['store'] != null) {
          stores?.add(PlaystationGameStore.fromJson(v['store']));
        }
      });
    }
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = [];
      json['ratings'].forEach((dynamic v) {
        ratings?.add(PlaystationGameRating.fromJson(v));
      });
    }
    ratingsCount = json['ratings_count'];
    reviewsTextCount = json['reviews_text_count'];
    added = json['added'];
    addedByStatus = json['added_by_status'] != null
        ? PlaystationGameAddedByStatus.fromJson(json['added_by_status'])
        : null;
    metacritic = json['metacritic'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
    id = json['id'];
    score = json['score'];
    clip = json['clip'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((dynamic v) {
        tags?.add(PlaystationGameTag.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'] != null
        ? PlaystationGameEsrbRating.fromJson(json['esrb_rating'])
        : null;
    userGame = json['user_game'];
    reviewsCount = json['reviews_count'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    if (json['short_screenshots'] != null) {
      shortScreenshots = [];
      json['short_screenshots'].forEach((dynamic v) {
        shortScreenshots?.add(PlaystationGameShortScreenshots.fromJson(v));
      });
    }
    if (json['parent_platforms'] != null) {
      parentPlatforms = [];
      json['parent_platforms'].forEach((dynamic v) {
        if (v['platform'] != null) {
          parentPlatforms?.add(PlaystationGamePlatform.fromJson(v['platform']));
        }
      });
    }
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((dynamic v) {
        genres?.add(PlaystationGameGenre.fromJson(v));
      });
    }
  }

  String? slug;
  String? name;
  num? playtime;
  List<PlaystationGamePlatform>? platforms;
  List<PlaystationGameStore>? stores;
  String? released;
  bool? tba;
  String? backgroundImage;
  num? rating;
  num? ratingTop;
  List<PlaystationGameRating>? ratings;
  num? ratingsCount;
  num? reviewsTextCount;
  num? added;
  PlaystationGameAddedByStatus? addedByStatus;
  num? metacritic;
  num? suggestionsCount;
  String? updated;
  num? id;
  dynamic score;
  dynamic clip;
  List<PlaystationGameTag>? tags;
  PlaystationGameEsrbRating? esrbRating;
  dynamic userGame;
  num? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<PlaystationGameShortScreenshots>? shortScreenshots;
  List<PlaystationGamePlatform>? parentPlatforms;
  List<PlaystationGameGenre>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = slug;
    map['name'] = name;
    map['playtime'] = playtime;
    if (platforms != null) {
      map['platforms'] = platforms?.map((v) => v.toJson()).toList();
    }
    if (stores != null) {
      map['stores'] = stores?.map((v) => v.toJson()).toList();
    }
    map['released'] = released;
    map['tba'] = tba;
    map['background_image'] = backgroundImage;
    map['rating'] = rating;
    map['rating_top'] = ratingTop;
    if (ratings != null) {
      map['ratings'] = ratings?.map((v) => v.toJson()).toList();
    }
    map['ratings_count'] = ratingsCount;
    map['reviews_text_count'] = reviewsTextCount;
    map['added'] = added;
    if (addedByStatus != null) {
      map['added_by_status'] = addedByStatus?.toJson();
    }
    map['metacritic'] = metacritic;
    map['suggestions_count'] = suggestionsCount;
    map['updated'] = updated;
    map['id'] = id;
    map['score'] = score;
    map['clip'] = clip;
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (esrbRating != null) {
      map['esrb_rating'] = esrbRating?.toJson();
    }
    map['user_game'] = userGame;
    map['reviews_count'] = reviewsCount;
    map['saturated_color'] = saturatedColor;
    map['dominant_color'] = dominantColor;
    if (shortScreenshots != null) {
      map['short_screenshots'] =
          shortScreenshots?.map((v) => v.toJson()).toList();
    }
    if (parentPlatforms != null) {
      map['parent_platforms'] =
          parentPlatforms?.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
