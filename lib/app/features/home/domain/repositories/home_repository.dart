import 'package:ardilla/app/features/home/data/model/benefits_model.dart';
import 'package:ardilla/app/features/home/data/model/cash_flow_model.dart';
import 'package:ardilla/app/features/home/data/model/rank_model.dart';
import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CarouselEntity>>> fetchCarousel();
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
  Future<Either<Failure, CashFlowModel>> fetchCashFlows();
  Future<Either<Failure, List<BenefitsModel>>> fetchBenefits();
  Future<Either<Failure, List<RankModel>>> fetchRanks();
}
