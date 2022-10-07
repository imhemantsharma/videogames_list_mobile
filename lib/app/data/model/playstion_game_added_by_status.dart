class PlaystationGameAddedByStatus {
  PlaystationGameAddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  PlaystationGameAddedByStatus.fromJson(dynamic json) {
    yet = json['yet'];
    owned = json['owned'];
    beaten = json['beaten'];
    toplay = json['toplay'];
    dropped = json['dropped'];
    playing = json['playing'];
  }
  num? yet;
  num? owned;
  num? beaten;
  num? toplay;
  num? dropped;
  num? playing;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['yet'] = yet;
    map['owned'] = owned;
    map['beaten'] = beaten;
    map['toplay'] = toplay;
    map['dropped'] = dropped;
    map['playing'] = playing;
    return map;
  }
}
