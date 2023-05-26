import 'package:ardilla/app/features/auth/domain/repositories/sign_up_repository.dart';
import 'package:ardilla/core/usecase/usecase_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:ardilla/core/error/failures.dart';

class CheckIfUserExistsUsecase extends UseCase<bool, String> {
  final AuthRepository repository;

  CheckIfUserExistsUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await repository.checkUserExists(params: params);
  }
}
