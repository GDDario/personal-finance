import 'package:personal_finance/model/user_type.dart';

class User {
  int id;
  String name;
  String? password;
  UserType userType;

  User({required this.id, required this.name, required this.userType});
}
