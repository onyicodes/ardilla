import 'package:ardilla/app/features/auth/data/datasources/signup_dataprovider.dart';
import 'package:ardilla/app/features/auth/data/repository/signup_repository_impl.dart';
import 'package:ardilla/app/features/auth/domain/repositories/sign_up_repository.dart';
import 'package:ardilla/app/features/auth/domain/usecases/email_sign_up_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/google_signup_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/validators/auth_field_validator.dart';
import 'package:get/get.dart';

final getAuthControllerSl = GetInstance();

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    getAuthControllerSl.lazyPut<AuthController>(() => AuthController(
        emailSignupUsecase: getAuthControllerSl(),
        authFieldValidationPage: getAuthControllerSl(),
        flutterSecureStorage: getAuthControllerSl(),
        checkIfUserExistsUsecase: getAuthControllerSl(),
        signinUsecase: getAuthControllerSl(),
        storeBox: getAuthControllerSl()), permanent: true);

    getAuthControllerSl.lazyPut<SignupUsecase>(
        () => SignupUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<SigninUsecase>(
        () => SigninUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl.lazyPut<CheckIfUserExistsUsecase>(
        () => CheckIfUserExistsUsecase(repository: getAuthControllerSl()));

    getAuthControllerSl
        .lazyPut<AuthFieldValidationPage>(() => AuthFieldValidationPage());

    getAuthControllerSl.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(dataProvider: getAuthControllerSl()));

    getAuthControllerSl
        .lazyPut<AuthLocalDataProvider>(() => AuthLocalDataProviderImpl());
  }
}
