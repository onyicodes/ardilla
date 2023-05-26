
import 'package:ardilla/app/features/splash/presentation/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';


final getSplashscreenControllerSl = GetInstance();

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    getSplashscreenControllerSl.lazyPut<SplashScreenController>(
        () => SplashScreenController(),);

  }
}
