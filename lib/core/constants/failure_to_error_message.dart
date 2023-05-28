import 'package:ardilla/core/error/failures.dart';
import 'package:ardilla/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

String mapFailureToErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      const response = "Server error occourred";
      return response;
    case UnknownFailure:
      final response =LocaleKeys.error_unknownError.tr();
      return response;
    case AccountExistsFailure:
      final response = LocaleKeys.error_accountExists.tr();
      return response;
    case AccountNotFoundFailure:
      final response = LocaleKeys.error_accountNotFound.tr();
      return response;
    case CacheFailure:
      final response = LocaleKeys.error_cachingFailed.tr();
      return response;
    case NotFoundFailure:
      final response = LocaleKeys.error_noResultError.tr();
      return response;
    case BadRequestFailure:
      final response = LocaleKeys.error_badRequest.tr();
      return response;
    case ForbiddenFailure:
      final response = LocaleKeys.error_forBiddenError.tr();
      return response;
   default:
      final response = LocaleKeys.error_unknownError.tr();
      return response;
  }
}
