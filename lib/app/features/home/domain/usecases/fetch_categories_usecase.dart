import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/app/features/home/domain/repositories/home_repository.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/core/parameters/no_params.dart';
import 'package:ardilla/core/usecase/usecase_builder.dart';
import 'package:dartz/dartz.dart';

class FetchCategoriesUsecase extends UseCase<List<CategoryEntity>, NoParams> {
  final HomeRepository repository;

  FetchCategoriesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.fetchCategories();
  }
}
