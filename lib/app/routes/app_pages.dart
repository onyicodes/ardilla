import 'package:ardilla/app/features/auth/presentation/bindings/signup_binding.dart';
import 'package:ardilla/app/features/auth/presentation/pages/create_account_page.dart';
import 'package:ardilla/app/features/auth/presentation/pages/signup_page.dart';
import 'package:ardilla/app/features/auth/presentation/pages/verify_email_page.dart';
import 'package:ardilla/app/features/home/presentation/bindings/home_binding.dart';
import 'package:ardilla/app/features/home/presentation/pages/home_page.dart';
import 'package:ardilla/app/features/landing/presentation/bindings/landing_binding.dart';
import 'package:ardilla/app/features/landing/presentation/pages/landing_page.dart';
import 'package:ardilla/app/features/onboarding/presentation/bindings/onboard_binding.dart';
import 'package:ardilla/app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:ardilla/app/features/splash/presentation/bindings/splash_screen_binding.dart';
import 'package:ardilla/app/features/splash/presentation/pages/splash_screen.dart';
import 'package:ardilla/app/getx_managers/middlewares/auth_guard_middlewares.dart';
import 'package:ardilla/app/getx_managers/middlewares/onboard_guard_middleware.dart';
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
         middlewares: [AuthGuardMiddleware()],
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.home,
        page: () =>const HomePage(),
        binding: HomeBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.onboarding,
        page: () => OnboardingPage(),
        binding: OnboardingBinding(),
        middlewares: [OnboardGuardMiddleware()],
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.auth,
        page: () => AuthPage(),
        binding: AuthBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.verifyEmailPage,
        page: () => VerifyEmailPage(),
        binding: AuthBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.createAccountPage,
        page: () => CreateAccountPage(),
        binding: AuthBinding(),
        transition: Transition.leftToRight),
  ];
}
