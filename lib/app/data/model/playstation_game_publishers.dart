class PlaystationGamePublishers {
  PlaystationGamePublishers({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
  });

  PlaystationGamePublishers.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
  num? id;
  String? name;
  String? slug;
  num? gamesCount;
  String? imageBackground;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['games_count'] = gamesCount;
    map['image_background'] = imageBackground;
    return map;
  }
}