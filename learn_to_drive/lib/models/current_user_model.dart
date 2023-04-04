CurrentUser currentUser = CurrentUser();

class CurrentUser {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;

  CurrentUser(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,});

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      id : json['id'],
      name : json['name'],
      email : json['email'],
      phoneNumber : json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}