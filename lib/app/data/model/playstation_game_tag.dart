class PlaystationGameTag {
  PlaystationGameTag({
    this.id,
    this.name,
    this.slug,
    this.language,
    this.gamesCount,
    this.imageBackground,
  });

  PlaystationGameTag.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
  num? id;
  String? name;
  String? slug;
  String? language;
  num? gamesCount;
  String? imageBackground;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['language'] = language;
    map['games_count'] = gamesCount;
    map['image_background'] = imageBackground;
    return map;
  }
}
