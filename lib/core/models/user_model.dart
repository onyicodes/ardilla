import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String userName;
  final String phone;
  final String lastName;
  final String refCode;
  final DateTime dateCreated;

  const UserModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.phone,
    required this.firstName,
    required this.refCode,
    required this.lastName,
    required this.dateCreated,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        phone: json["phone"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        userName: json["username"] ?? "",
        refCode: json["refCode"] ?? "",
        dateCreated: DateTime.parse(json["dateCreated"])
      );

  Map<String, dynamic> toMap() => {
        "id":id,
        "email": email,
        "username": userName,
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "refCode": refCode,
        "dateCreated": dateCreated.toIso8601String()
      };

  @override
  List<Object?> get props => [];
}
