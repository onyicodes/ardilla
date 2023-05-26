import 'package:ardilla/core/models/user_model.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:dartz/dartz.dart';
import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:ardilla/core/parameters/signup/google_signup_params.dart';
import 'package:ardilla/core/parameters/signup/verify_token_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signup({required SignupParams params});
  Future<Either<Failure, UserModel>> signin({required SigninParams params});
  Future<Either<Failure, bool>> checkUserExists({required String params});
}
