import 'package:ardilla/app/features/auth/data/datasources/signup_dataprovider.dart';
import 'package:ardilla/app/features/auth/domain/repositories/sign_up_repository.dart';
import 'package:ardilla/core/models/user_model.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:dartz/dartz.dart';
import 'package:ardilla/core/error/exceptions.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:ardilla/core/parameters/signup/google_signup_params.dart';
import 'package:ardilla/core/parameters/signup/verify_token_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataProvider dataProvider;

  AuthRepositoryImpl({required this.dataProvider});

  @override
  Future<Either<Failure, bool>> signup({required SignupParams params}) async {
    try {
      bool successMessage = await dataProvider.signup(params: params);
      return Right(successMessage);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on UnknownException {
      return Left(UnknownFailure());
    } catch (e) {
      print("email signup error $e");
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signin(
      {required SigninParams params}) async {
    try {
      UserModel successMessage = await dataProvider.signin(params: params);
      return Right(successMessage);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on UnknownException {
      return Left(UnknownFailure());
    } catch (e) {
      print("google signup error $e");
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserExists(
      {required String params}) async {
    try {
      bool successMessage = await dataProvider.checkUserExists(email: params);
      return Right(successMessage);
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    } on UnknownException {
      return Left(UnknownFailure());
    } on ForbiddenException {
      return Left(ForbiddenFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
