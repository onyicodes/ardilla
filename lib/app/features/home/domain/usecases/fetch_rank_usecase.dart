import 'package:ardilla/app/features/home/data/model/rank_model.dart';
import 'package:ardilla/app/features/home/domain/repositories/home_repository.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/core/parameters/no_params.dart';
import 'package:ardilla/core/usecase/usecase_builder.dart';
import 'package:dartz/dartz.dart';

class FetchRanksUsecase extends UseCase<List<RankModel>, NoParams> {
  final HomeRepository repository;

  FetchRanksUsecase({required this.repository});

  @override
  Future<Either<Failure, List<RankModel>>> call(NoParams params) async {
    return await repository.fetchRanks();
  }
}
