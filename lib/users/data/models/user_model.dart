import 'package:rise_up_task/users/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.gender,
      required super.status});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        gender: jsonData['gender'],
        status: jsonData['status']);
  }
}
