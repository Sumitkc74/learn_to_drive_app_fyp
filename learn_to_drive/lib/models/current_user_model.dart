CurrentUser currentUser = CurrentUser();

class CurrentUser {
  String? name;
  String? email;
  String? phoneNumber;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  CurrentUser(
      {this.name,
      this.email,
      this.phoneNumber,
      this.role,
      this.updatedAt,
      this.createdAt,
      this.id});

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      name : json['name'],
      email : json['email'],
      phoneNumber : json['phoneNumber'],
      role : json['role'],
      updatedAt : json['updated_at'],
      createdAt : json['created_at'],
      id : json['id'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   data['email'] = email;
  //   data['phoneNumber'] = phoneNumber;
  //   data['role'] = role;
  //   data['updated_at'] = updatedAt;
  //   data['created_at'] = createdAt;
  //   data['id'] = id;
  //   return data;
  // }
}