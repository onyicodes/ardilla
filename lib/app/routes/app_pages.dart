import 'package:ardilla/app/features/landing/presentation/bindings/landing_binding.dart';
import 'package:ardilla/app/features/landing/presentation/pages/landing_page.dart';
import 'package:ardilla/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:ardilla/app/features/splash/presentation/pages/splash_screen.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: Routes.initial,
        page: () => SplashScreenPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.landing,
        page: () => LandingPage(),
        binding: LandingBinding(),
        transition: Transition.leftToRight),

  ];
}
