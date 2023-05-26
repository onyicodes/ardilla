import 'package:ardilla/app/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

final onboardingControllerSl = GetInstance();

class OnboardingBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<OnboardingController>(() => OnboardingController(storeBox: onboardingControllerSl()));
  }
}