import 'package:equatable/equatable.dart';

class SignupParams extends Equatable {
  final String email;
  final String firstName;
  final String userName;
  final String phone;
  final String password;
  final String lastName;
  final String refCode;

  const SignupParams({
    required this.email,
    required this.userName,
    required this.phone,
    required this.password,
    required this.firstName,
    required this.refCode,
    required this.lastName,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": userName,
        "phone": phone,
        "firstName":firstName,
        "password": password,
        "countryCode": lastName,
        "refCode": refCode,
      };

  @override
  List<Object?> get props => [];
}
