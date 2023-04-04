// List<User> userFromJson(
//         List<dynamic> userJson) =>
//     List<User>.from(userJson.map((userJson) =>
//         User.fromJson(userJson)));

// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? emailVerifiedAt;
//   String? phoneNumber;
//   String? role;
//   String? createdAt;
//   String? updatedAt;

//   User(
//       {this.id,
//       this.name,
//       this.email,
//       this.emailVerifiedAt,
//       this.phoneNumber,
//       this.role,
//       this.createdAt,
//       this.updatedAt});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     phoneNumber = json['phoneNumber'];
//     role = json['role'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['phoneNumber'] = phoneNumber;
//     data['role'] = role;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }