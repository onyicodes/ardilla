import 'package:ardilla/app/features/auth/domain/repositories/sign_up_repository.dart';
import 'package:ardilla/core/usecase/usecase_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';

class SignupUsecase extends UseCase<bool, SignupParams> {
  final AuthRepository repository;

  SignupUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(SignupParams params) async {
    return await repository.signup(params: params);
  }
}
