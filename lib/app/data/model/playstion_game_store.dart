class PlaystationGameStore {
  PlaystationGameStore({
    this.id,
    this.name,
    this.slug,
    this.domain,
    this.gamesCount,
    this.imageBackground,
  });

  PlaystationGameStore.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    domain = json['domain'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }
  num? id;
  String? name;
  String? slug;
  String? domain;
  num? gamesCount;
  String? imageBackground;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['domain'] = domain;
    map['games_count'] = gamesCount;
    map['image_background'] = imageBackground;
    return map;
  }
}
