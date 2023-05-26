import 'package:equatable/equatable.dart';

class UserDetailsEntity extends Equatable {
  final String id;
  final String email;
  final String phone;
  final String role;

  const UserDetailsEntity({
    required this.id,
    required this.email,
    required this.phone,
    required this.role,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
        role
      ];
}
