class UserDataResponse {
  UserDataResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory UserDataResponse.fromJson(dynamic json) => UserDataResponse(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
      );

  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['website'] = website;
    return map;
  }
}
