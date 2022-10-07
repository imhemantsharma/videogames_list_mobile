class PlaystationGameShortScreenshots {
  PlaystationGameShortScreenshots({
    this.id,
    this.image,
  });

  PlaystationGameShortScreenshots.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  num? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }
}
