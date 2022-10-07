class PlaystationGamePlatform {
  PlaystationGamePlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  PlaystationGamePlatform.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    yearEnd = json['year_end'];
    yearStart = json['year_start'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
  num? id;
  String? name;
  String? slug;
  dynamic image;
  dynamic yearEnd;
  dynamic yearStart;
  num? gamesCount;
  String? imageBackground;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['year_end'] = yearEnd;
    map['year_start'] = yearStart;
    map['games_count'] = gamesCount;
    map['image_background'] = imageBackground;
    return map;
  }
}
