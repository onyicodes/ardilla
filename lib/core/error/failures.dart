import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = ""});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class AccountExistsFailure extends Failure {}

class NotFoundFailure extends Failure {}

class AccountNotFoundFailure extends Failure{}

class ForbiddenFailure extends Failure {}

class BadRequestFailure extends Failure {}

class UnknownFailure extends Failure {}
