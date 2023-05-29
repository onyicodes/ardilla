import 'package:ardilla/app/features/home/data/datasources/home_dataprovider.dart';
import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/app/features/home/domain/repositories/home_repository.dart';
import 'package:ardilla/core/error/exceptions.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataProvider dataProvider;

  HomeRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel() async {
    try {
      List<CarouselEntity> carouselEntityList =
          await dataProvider.fetchCarousel();
      return Right(carouselEntityList);
    } on ServerException {
      return Left(ServerFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      List<CategoryEntity> categoryEntityList =
          await dataProvider.fetchCategories();
      return Right(categoryEntityList);
    } on ServerException {
      return Left(ServerFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
