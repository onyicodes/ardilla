import 'package:ardilla/app/features/auth/data/datasources/signup_dataprovider.dart';
import 'package:ardilla/app/features/auth/data/repository/signup_repository_impl.dart';
import 'package:ardilla/app/features/auth/domain/repositories/sign_up_repository.dart';
import 'package:ardilla/app/features/auth/domain/usecases/email_sign_up_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/google_signup_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/validators/auth_field_validator.dart';
import 'package:get/get.dart';

final getSignupControllerSl = GetInstance();

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    getSignupControllerSl.lazyPut<AuthController>(() => AuthController(
        emailSignupUsecase: getSignupControllerSl(),
        authFieldValidationPage: getSignupControllerSl(),
        checkIfUserExistsUsecase: getSignupControllerSl(),
        googleSignupUsecase: getSignupControllerSl(),
        storeBox: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<SignupUsecase>(
        () => SignupUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<SigninUsecase>(
        () => SigninUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl.lazyPut<CheckIfUserExistsUsecase>(
        () => CheckIfUserExistsUsecase(repository: getSignupControllerSl()));

    getSignupControllerSl
        .lazyPut<AuthFieldValidationPage>(() => AuthFieldValidationPage());

    getSignupControllerSl.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(dataProvider: getSignupControllerSl()));

    getSignupControllerSl
        .lazyPut<AuthLocalDataProvider>(() => AuthLocalDataProviderImpl());
  }
}
