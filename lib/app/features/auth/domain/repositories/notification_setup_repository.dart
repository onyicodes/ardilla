import 'package:dartz/dartz.dart';
import 'package:ardilla/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:ardilla/core/error/failures.dart';

abstract class NotificationOnboardContentRepository {
  Future<Either<Failure, List<OnboardContentEntity>>>
      fetchNotificationSetupContents({required String accountType});
}
