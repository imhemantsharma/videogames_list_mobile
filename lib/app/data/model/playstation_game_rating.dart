class PlaystationGameRating {
  PlaystationGameRating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  PlaystationGameRating.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }
  num? id;
  String? title;
  num? count;
  num? percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['count'] = count;
    map['percent'] = percent;
    return map;
  }
}
