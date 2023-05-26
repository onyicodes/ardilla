import 'package:equatable/equatable.dart';

class GoogleSignupParams extends Equatable {
  final String email;
  final String userName;
  final String phone;
  final String photoUrl;
  final String role;
  final String googleId;

  const GoogleSignupParams(
      {required this.email,
      required this.userName,
      required this.phone,
      required this.photoUrl,
      required this.googleId,
      required this.role});

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": userName,
        "phone": phone,
        "role": role,
        "googleId":googleId,
        "photo": phone
      };

  @override
  List<Object?> get props => [];
}
