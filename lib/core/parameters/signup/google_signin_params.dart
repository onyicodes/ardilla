import 'package:equatable/equatable.dart';

///Used in passing in the login parameters
///
///The user property can be [email], [phone] (phone with the country code) or [username]
class GoogleSigninParams extends Equatable {
  final String email;
  final String googleId;

  const GoogleSigninParams({
    required this.email,
    required this.googleId,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "googleId": googleId,
      };

  @override
  List<Object?> get props => [];
}
