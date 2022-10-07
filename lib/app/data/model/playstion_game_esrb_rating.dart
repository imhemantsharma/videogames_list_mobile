class PlaystationGameEsrbRating {
  PlaystationGameEsrbRating({
    this.id,
    this.name,
    this.slug,
    this.nameEn,
    this.nameRu,
  });

  PlaystationGameEsrbRating.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
  }
  num? id;
  String? name;
  String? slug;
  String? nameEn;
  String? nameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['name_en'] = nameEn;
    map['name_ru'] = nameRu;
    return map;
  }
}
