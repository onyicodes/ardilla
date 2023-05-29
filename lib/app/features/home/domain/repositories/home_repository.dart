import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
}
