import 'package:ardilla/app/features/auth/presentation/bindings/signup_binding.dart';
import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/constants/error_texts.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:email_validator/email_validator.dart';

final authController = getAuthControllerSl<AuthController>();

class AuthFieldValidationPage {
  Future<bool> validateSignupParams({required SignupParams params}) {
    bool validated = true;
    if (params.userName.isEmpty) {
      authController.userNameError =
          AuthFieldValidationErrorMessage.userNameEmpty;
      validated = false;
    }

    if (params.firstName.isEmpty) {
      authController.firstNameError =
          AuthFieldValidationErrorMessage.firstNameEmpty;
      validated = false;
    }

    if (params.lastName.isEmpty) {
      authController.lastNameError =
          AuthFieldValidationErrorMessage.lastNameEmpty;
      validated = false;
    }


    if (params.phone.isEmpty) {
      authController.phoneError =
          AuthFieldValidationErrorMessage.phoneEmpty;
      validated = false;
    }
    
    if (!authController.validPasswordField) {
      authController.passwordError =
          AuthFieldValidationErrorMessage.passwordFormatWrong;
      validated = false;
    }


    if (params.password.isEmpty) {
      authController.passwordError =
          AuthFieldValidationErrorMessage.passwordEmpty;
      validated = false;
    }

    return Future.value(validated);
  }

  Future<bool> validateEmail({required String email}){
    bool validated = true;
     if (email.isEmpty) {
      authController.emailError = AuthFieldValidationErrorMessage.emailEmpty;
      validated = false;
    }else if (!EmailValidator.validate(email)) {
      authController.emailError =
          AuthFieldValidationErrorMessage.emailFormatWrong;
      validated = false;
    }

    return  Future.value(validated);
  }

  Future<bool> validateSigninParams({required SigninParams params}) {
    bool validated = true;
    if (params.email.isEmpty) {
      authController.signInEmailError =
          AuthFieldValidationErrorMessage.fieldEmpty;
      validated = false;
    }

    if (params.password.isEmpty) {
      authController.signInPasswordError =
          AuthFieldValidationErrorMessage.passwordEmpty;
      validated = false;
    }

    return Future.value(validated);
  }
}
