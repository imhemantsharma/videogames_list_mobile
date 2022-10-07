import 'playstation_game_developers.dart';
import 'playstation_game_genre.dart';
import 'playstation_game_platform.dart';
import 'playstation_game_publishers.dart';
import 'playstation_game_rating.dart';
import 'playstation_game_tag.dart';
import 'playstion_game_added_by_status.dart';
import 'playstion_game_store.dart';

class PlaystationGameDetailResponse {
  PlaystationGameDetailResponse({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  PlaystationGameDetailResponse.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    nameOriginal = json['name_original'];
    description = json['description'];
    metacritic = json['metacritic'];
    released = json['released'];
    tba = json['tba'];
    updated = json['updated'];
    backgroundImage = json['background_image'];
    backgroundImageAdditional = json['background_image_additional'];
    website = json['website'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = [];
      json['ratings'].forEach((v) {
        ratings?.add(PlaystationGameRating.fromJson(v));
      });
    }
    reactions = json['reactions'];
    added = json['added'];
    addedByStatus = json['added_by_status'] != null
        ? PlaystationGameAddedByStatus.fromJson(json['added_by_status'])
        : null;
    playtime = json['playtime'];
    screenshotsCount = json['screenshots_count'];
    moviesCount = json['movies_count'];
    creatorsCount = json['creators_count'];
    achievementsCount = json['achievements_count'];
    parentAchievementsCount = json['parent_achievements_count'];
    redditUrl = json['reddit_url'];
    redditName = json['reddit_name'];
    redditDescription = json['reddit_description'];
    redditLogo = json['reddit_logo'];
    redditCount = json['reddit_count'];
    twitchCount = json['twitch_count'];
    youtubeCount = json['youtube_count'];
    reviewsTextCount = json['reviews_text_count'];
    ratingsCount = json['ratings_count'];
    suggestionsCount = json['suggestions_count'];
    metacriticUrl = json['metacritic_url'];
    parentsCount = json['parents_count'];
    additionsCount = json['additions_count'];
    gameSeriesCount = json['game_series_count'];
    userGame = json['user_game'];
    reviewsCount = json['reviews_count'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    if (json['parent_platforms'] != null) {
      parentPlatforms = [];
      json['parent_platforms'].forEach((dynamic v) {
        if (v['platform'] != null) {
          parentPlatforms?.add(PlaystationGamePlatform.fromJson(v['platform']));
        }
      });
    }
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
        if (json['store'] != null) {
          stores?.add(PlaystationGameStore.fromJson(v['store']));
        }
      });
    }
    if (json['developers'] != null) {
      developers = [];
      json['developers'].forEach((v) {
        developers?.add(PlaystationGameDevelopers.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(PlaystationGameGenre.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(PlaystationGameTag.fromJson(v));
      });
    }
    if (json['publishers'] != null) {
      publishers = [];
      json['publishers'].forEach((v) {
        publishers?.add(PlaystationGamePublishers.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'];
    clip = json['clip'];
    descriptionRaw = json['description_raw'];
  }
  num? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  num? metacritic;
  String? released;
  bool? tba;
  String? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  num? rating;
  num? ratingTop;
  List<PlaystationGameRating>? ratings;
  dynamic reactions;
  num? added;
  PlaystationGameAddedByStatus? addedByStatus;
  num? playtime;
  num? screenshotsCount;
  num? moviesCount;
  num? creatorsCount;
  num? achievementsCount;
  num? parentAchievementsCount;
  String? redditUrl;
  String? redditName;
  String? redditDescription;
  String? redditLogo;
  num? redditCount;
  num? twitchCount;
  num? youtubeCount;
  num? reviewsTextCount;
  num? ratingsCount;
  num? suggestionsCount;
  String? metacriticUrl;
  num? parentsCount;
  num? additionsCount;
  num? gameSeriesCount;
  dynamic userGame;
  num? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<PlaystationGamePlatform>? parentPlatforms;
  List<PlaystationGamePlatform>? platforms;
  List<PlaystationGameStore>? stores;
  List<PlaystationGameDevelopers>? developers;
  List<PlaystationGameGenre>? genres;
  List<PlaystationGameTag>? tags;
  List<PlaystationGamePublishers>? publishers;
  dynamic esrbRating;
  dynamic clip;
  String? descriptionRaw;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['name'] = name;
    map['name_original'] = nameOriginal;
    map['description'] = description;
    map['metacritic'] = metacritic;
    map['released'] = released;
    map['tba'] = tba;
    map['updated'] = updated;
    map['background_image'] = backgroundImage;
    map['background_image_additional'] = backgroundImageAdditional;
    map['website'] = website;
    map['rating'] = rating;
    map['rating_top'] = ratingTop;
    if (ratings != null) {
      map['ratings'] = ratings?.map((v) => v.toJson()).toList();
    }
    map['reactions'] = reactions;
    map['added'] = added;
    if (addedByStatus != null) {
      map['added_by_status'] = addedByStatus?.toJson();
    }
    map['playtime'] = playtime;
    map['screenshots_count'] = screenshotsCount;
    map['movies_count'] = moviesCount;
    map['creators_count'] = creatorsCount;
    map['achievements_count'] = achievementsCount;
    map['parent_achievements_count'] = parentAchievementsCount;
    map['reddit_url'] = redditUrl;
    map['reddit_name'] = redditName;
    map['reddit_description'] = redditDescription;
    map['reddit_logo'] = redditLogo;
    map['reddit_count'] = redditCount;
    map['twitch_count'] = twitchCount;
    map['youtube_count'] = youtubeCount;
    map['reviews_text_count'] = reviewsTextCount;
    map['ratings_count'] = ratingsCount;
    map['suggestions_count'] = suggestionsCount;
    map['metacritic_url'] = metacriticUrl;
    map['parents_count'] = parentsCount;
    map['additions_count'] = additionsCount;
    map['game_series_count'] = gameSeriesCount;
    map['user_game'] = userGame;
    map['reviews_count'] = reviewsCount;
    map['saturated_color'] = saturatedColor;
    map['dominant_color'] = dominantColor;
    if (parentPlatforms != null) {
      map['parent_platforms'] =
          parentPlatforms?.map((v) => v.toJson()).toList();
    }
    if (platforms != null) {
      map['platforms'] = platforms?.map((v) => v.toJson()).toList();
    }
    if (stores != null) {
      map['stores'] = stores?.map((v) => v.toJson()).toList();
    }
    if (developers != null) {
      map['developers'] = developers?.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (publishers != null) {
      map['publishers'] = publishers?.map((v) => v.toJson()).toList();
    }
    map['esrb_rating'] = esrbRating;
    map['clip'] = clip;
    map['description_raw'] = descriptionRaw;
    return map;
  }
}
