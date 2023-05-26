import 'package:ardilla/app/features/auth/domain/repositories/sign_up_repository.dart';
import 'package:ardilla/core/models/user_model.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:ardilla/core/usecase/usecase_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:ardilla/core/error/failures.dart';

class SigninUsecase extends UseCase<UserModel, SigninParams> {
  final AuthRepository repository;

  SigninUsecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(SigninParams params) async {
    return await repository.signin(params: params);
  }
}
