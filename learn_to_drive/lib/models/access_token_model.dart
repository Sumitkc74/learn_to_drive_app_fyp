UserAccessToken userAccessToken = UserAccessToken();

class UserAccessToken {
  AccessToken? accessToken;
  String? plainTextToken;

  UserAccessToken({this.accessToken, this.plainTextToken});

  UserAccessToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'] != null
        ? AccessToken.fromJson(json['accessToken'])
        : null;
    plainTextToken = json['plainTextToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (accessToken != null) {
      data['accessToken'] = accessToken!.toJson();
    }
    data['plainTextToken'] = plainTextToken;
    return data;
  }
}

class AccessToken {
  String? name;
  List<String>? abilities;
  String? expiresAt;
  int? tokenableId;
  String? tokenableType;
  String? updatedAt;
  String? createdAt;
  int? id;

  AccessToken(
      {this.name,
      this.abilities,
      this.expiresAt,
      this.tokenableId,
      this.tokenableType,
      this.updatedAt,
      this.createdAt,
      this.id});

  AccessToken.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abilities = json['abilities'].cast<String>();
    expiresAt = json['expires_at'];
    tokenableId = json['tokenable_id'];
    tokenableType = json['tokenable_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['abilities'] = abilities;
    data['expires_at'] = expiresAt;
    data['tokenable_id'] = tokenableId;
    data['tokenable_type'] = tokenableType;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}