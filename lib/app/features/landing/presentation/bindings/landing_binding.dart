import 'package:ardilla/app/features/landing/presentation/controllers/landing_controller.dart';
import 'package:get/get.dart';

final landingControllerSl = GetInstance();

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    landingControllerSl.lazyPut<LandingController>(() => LandingController(),
        permanent: true);

  }
}
