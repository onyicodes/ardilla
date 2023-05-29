import 'package:ardilla/app/features/home/presentation/bindings/home_binding.dart';
import 'package:ardilla/app/features/landing/presentation/controllers/landing_controller.dart';
import 'package:get/get.dart';

final landingControllerSl = GetInstance();

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    landingControllerSl.lazyPut<LandingController>(() => LandingController(storeBox: landingControllerSl()),
        permanent: true);
    HomeBinding().dependencies();
  }
}
