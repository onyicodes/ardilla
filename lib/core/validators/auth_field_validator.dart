import 'package:ardilla/app/features/auth/presentation/bindings/signup_binding.dart';
import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/constants/error_texts.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:email_validator/email_validator.dart';

final signupController = getSignupControllerSl<AuthController>();

class AuthFieldValidationPage {
  Future<bool> validateEmailSignupData({required SignupParams params}) {
    bool validated = true;
    if (params.userName.isEmpty) {
      signupController.userNameError =
          AuthFieldValidationErrorMessage.userNameEmpty;
      validated = false;
    }

    if (params.email.isEmpty) {
      signupController.emailError = AuthFieldValidationErrorMessage.emailEmpty;
      validated = false;
    }

    if (!EmailValidator.validate(params.email)) {
      signupController.emailError =
          AuthFieldValidationErrorMessage.emailFormatWrong;
      validated = false;
    }
    if (params.password.isEmpty) {
      signupController.passwordError =
          AuthFieldValidationErrorMessage.passwordEmpty;
      validated = false;
    }

    return Future.value(validated);
  }

  // Future<bool> validateEmailSigninData({required SigninParams params}) {
  //   bool validated = true;
  //   if (params.email.isEmpty) {
  //     signinController.emailError = AuthFieldValidationErrorMessage.fieldEmpty;
  //     validated = false;
  //   }

  //   if (params.password.isEmpty) {
  //     signinController.passwordError =
  //         AuthFieldValidationErrorMessage.passwordEmpty;
  //     validated = false;
  //   }

  //   return Future.value(validated);
  // }
}
