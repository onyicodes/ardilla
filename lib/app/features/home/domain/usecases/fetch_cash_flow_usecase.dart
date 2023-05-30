import 'package:ardilla/app/features/home/data/model/cash_flow_model.dart';
import 'package:ardilla/app/features/home/domain/repositories/home_repository.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/core/parameters/no_params.dart';
import 'package:ardilla/core/usecase/usecase_builder.dart';
import 'package:dartz/dartz.dart';

class FetchCashFlowUsecase extends UseCase<CashFlowModel, NoParams> {
  final HomeRepository repository;

  FetchCashFlowUsecase({required this.repository});

  @override
  Future<Either<Failure, CashFlowModel>> call(NoParams params) async {
    return await repository.fetchCashFlows();
  }
}
