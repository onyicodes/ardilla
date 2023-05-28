import 'package:ardilla/app/features/landing/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

final homeControllerSl = GetInstance();

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    homeControllerSl.lazyPut<HomeController>(() => HomeController(),
        permanent: true);
  }
}
