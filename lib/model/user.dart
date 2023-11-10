import 'package:personal_finance/model/user_type.dart';

class User {
  int id;
  String name;
  String? password;
  UserType userType;

  User({required this.id, required this.name, required this.userType});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      userType: UserType.fromJson(json['userType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userType': userType.toJson(),
    };
  }
}