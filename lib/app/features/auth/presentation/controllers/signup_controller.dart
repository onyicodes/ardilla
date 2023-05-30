import 'dart:async';

import 'package:ardilla/app/features/auth/domain/usecases/email_sign_up_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/google_signup_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:ardilla/app/routes/app_pages.dart';
import 'package:ardilla/core/constants/failure_to_error_message.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:ardilla/core/general_widgets/custom_snackbar.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:ardilla/core/util/save_login_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:ardilla/core/validators/auth_field_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController refCodeController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController signInEmailAddressController =
      TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();

  final SignupUsecase emailSignupUsecase;
  final SigninUsecase signinUsecase;
  final CheckIfUserExistsUsecase checkIfUserExistsUsecase;
  final AuthFieldValidationPage authFieldValidationPage;
  final GetStorage storeBox;
  final FlutterSecureStorage flutterSecureStorage;
  AuthController(
      {required this.emailSignupUsecase,
      required this.checkIfUserExistsUsecase,
      required this.signinUsecase,
      required this.flutterSecureStorage,
      required this.authFieldValidationPage,
      required this.storeBox});

  RegExp regexSpecialCharater = RegExp(r'^(?=.*?[!@#\$&*~])');
  RegExp regexHas8Characters = RegExp(r'.{8,}$');
  RegExp regexHasUppercase = RegExp(r'^(?=.*[A-Z])');
  RegExp regexHasLowercase = RegExp(r'^(?=.*[a-z])');
  RegExp regexHasNumber = RegExp(r'^(?=.*?[0-9])');

  final _obscurePasswordText = true.obs;
  final _signupRequestStatus = RequestStatus.initial.obs;
  final _checkUserExistsRequestStatus = RequestStatus.initial.obs;
  final _signinRequestStatus = RequestStatus.initial.obs;
  final _phoneError = ''.obs;
  final _userNameError = ''.obs;
  final _passwordError = ''.obs;
  final _signInPasswordError = ''.obs;
  final _emailError = ''.obs;
  final _signInEmailError = ''.obs;
  final _refCodeError = "".obs;
  final _firstNameError = "".obs;
  final _lastNameError = "".obs;
  final _startedTypingPw = false.obs;
  final _validPasswordField = false.obs;
  final _emailEntered = "".obs;
  final _toSignIn = false.obs;

  final _has8Characters = false.obs;
  final _hasUppercase = false.obs;
  final _hasLowercase = false.obs;
  final _hasNumber = false.obs;
  final _hasSpecialCharacter = false.obs;

  final _reconnected = true.obs;

  bool get obscurePasswordText => _obscurePasswordText.value;
  String get phoneError => _phoneError.value;
  String get userNameError => _userNameError.value;
  String get passwordError => _passwordError.value;
  String get signInPasswordError => _signInPasswordError.value;
  String get emailError => _emailError.value;
  String get signInEmailError => _signInEmailError.value;
  String get refCodeError => _refCodeError.value;
  String get emailEntered => _emailEntered.value;
  String get firstNameError => _firstNameError.value;
  String get lastNameError => _lastNameError.value;
  RequestStatus get signupRequestStatus => _signupRequestStatus.value;
  RequestStatus get confirmAccountEmailRequestStatus =>
      _checkUserExistsRequestStatus.value;
  RequestStatus get signinRequestStatus => _signinRequestStatus.value;
  bool get startedTypingPw => _startedTypingPw.value;
  bool get validPasswordField => _validPasswordField.value;
  bool get reconnected => _reconnected.value;
  bool get toSignIn => _toSignIn.value;

  bool get has8Characters => _has8Characters.value;
  bool get hasUppercase => _hasUppercase.value;
  bool get hasLowercase => _hasLowercase.value;
  bool get hasNumber => _hasNumber.value;
  bool get hasSpecialCharacter => _hasSpecialCharacter.value;

  set obscurePasswordText(value) => _obscurePasswordText.value = value;
  set phoneError(value) => _phoneError.value = value;
  set userNameError(value) => _userNameError.value = value;
  set passwordError(value) => _passwordError.value = value;
  set signInPasswordError(value) => _signInPasswordError.value = value;
  set emailError(value) => _emailError.value = value;
  set lastNameError(value) => _lastNameError.value = value;
  set signupRequestStatus(value) => _signupRequestStatus.value = value;
  set confirmAccountEmailRequestStatus(value) =>
      _checkUserExistsRequestStatus.value = value;
  set signinRequestStatus(value) => _signinRequestStatus.value = value;
  set refCodeError(value) => _refCodeError.value = value;
  set firstNameError(value) => _firstNameError.value = value;
  set startedTypingPw(value) => _startedTypingPw.value = value;
  set validPasswordField(value) => _validPasswordField.value = value;
  set emailEntered(value) => _emailEntered.value = value;
  set signInEmailError(value) => _signInEmailError.value = value;

  set has8Characters(value) => _has8Characters.value = value;
  set hasUppercase(value) => _hasUppercase.value = value;
  set hasLowercase(value) => _hasLowercase.value = value;
  set hasNumber(value) => _hasNumber.value = value;
  set hasSpecialCharacter(value) => _hasSpecialCharacter.value = value;
  set toSignIn(value) => _toSignIn.value = value;
  late String lastUserId;

  @override
  onInit() {
    super.onInit();
    lastUserId = storeBox.read(CacheKeys.lastUserID) ?? "";
  }

  set reconnected(value) => _reconnected.value = value;

  checkPassword({required String text}) {
    //clears error text when user starts typing after an error occurred in the password field
    if (passwordError.isNotEmpty) {
      passwordError = '';
    }
    //checks if user has started typing to determine when to show the password field requirements
    if (text.isEmpty) {
      startedTypingPw = false;
    } else if (text.isNotEmpty && !startedTypingPw) {
      startedTypingPw = true;
    }
    regexSpecialCharater.hasMatch(text)
        ? hasSpecialCharacter = true
        : hasSpecialCharacter = false;

    regexHas8Characters.hasMatch(text)
        ? has8Characters = true
        : has8Characters = false;

    regexHasUppercase.hasMatch(text)
        ? hasUppercase = true
        : hasUppercase = false;

    regexHasLowercase.hasMatch(text)
        ? hasLowercase = true
        : hasLowercase = false;
    regexHasNumber.hasMatch(text) ? hasNumber = true : hasNumber = false;
    if (has8Characters &&
        hasUppercase &&
        hasLowercase &&
        hasNumber &&
        hasSpecialCharacter) {
      validPasswordField = true;
    } else {
      validPasswordField = false;
    }
  }

  Future<void> signup() async {
    signupRequestStatus = RequestStatus.loading;

    SignupParams params = SignupParams(
        email: emailAddressController.text.trim().toLowerCase(),
        firstName: firstNameController.text,
        userName: userNameController.text,
        phone: phoneController.text,
        rank:RankType.Cadet.name,
        password: passwordController.text.trim(),
        lastName: lastNameController.text,
        refCode: refCodeController.text);
    await authFieldValidationPage
        .validateSignupParams(params: params)
        .then((validated) async {
      if (validated) {
        final failOrSignup = await emailSignupUsecase(params);
        failOrSignup.fold((fail) {
          customSnackbar(
              title: 'Error', message: mapFailureToErrorMessage(fail));
          signupRequestStatus = RequestStatus.error;
        }, (successMessage) async {
          customSnackbar(
              title: "Success", message: "Account created successfully");
          await signin(email: params.email, password: params.password);
          signupRequestStatus = RequestStatus.success;
        });
      } else {
        signupRequestStatus = RequestStatus.error;
      }
    });
  }

  Future<void> signin({required String email, required String password}) async {
    signinRequestStatus = RequestStatus.loading;

    SigninParams params = SigninParams(
      email: email.trim().toLowerCase(),
      password: password.trim(),
    );

    await authFieldValidationPage
        .validateSigninParams(params: params)
        .then((validated) async {
      if (validated) {
        await Future.delayed(const Duration(milliseconds: 200));
        final failOrSignin = await signinUsecase(params);
        failOrSignin.fold((fail) {
          customSnackbar(
              title: 'Error', message: mapFailureToErrorMessage(fail));
          signinRequestStatus = RequestStatus.error;
        }, (user) async {
          customSnackbar(title: "Success", message: "Login successfully");
          await saveLoginData(
              userModel: user,
              email: params.email,
              storeBox: storeBox,
              password: params.password,
              secureStorage: flutterSecureStorage);
          Get.offAndToNamed(Routes.landing);
          signinRequestStatus = RequestStatus.success;
        });
      } else {
        signinRequestStatus = RequestStatus.error;
      }
    });
  }

  Future<void> verifyEmail() async {
    confirmAccountEmailRequestStatus = RequestStatus.loading;
    await Future.delayed(const Duration(milliseconds: 500));
    String email = emailAddressController.text.trim().toLowerCase();
    await authFieldValidationPage
        .validateEmail(email: email)
        .then((validated) async {
      if (validated) {
        final failOrEmailExists = await checkIfUserExistsUsecase(email);
        failOrEmailExists.fold((fail) {
          confirmAccountEmailRequestStatus = RequestStatus.error;
          customSnackbar(
              title: 'Error', message: mapFailureToErrorMessage(fail));
        }, (emailExists) {
          if (emailExists) {
            toSignIn = true;
            signInEmailAddressController.text = email;
            customSnackbar(title: "", message: "Signin to continue");
          } else {
            customSnackbar(
                title: "Confirm email address",
                message: "Verification code has been sent you email");
            toVerifyEmailPage();
          }
        });
        confirmAccountEmailRequestStatus = RequestStatus.success;
      } else {
        confirmAccountEmailRequestStatus = RequestStatus.error;
      }
    });
  }

  toVerifyEmailPage() {
    Get.toNamed(Routes.verifyEmailPage);
  }

  openEmailApp() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: emailEntered,
    );
    if (await canLaunchUrl(launchUri)) {
      launchUrl(launchUri, mode: LaunchMode.platformDefault);
    } else {
      // toastGeneral(message: 'unable to launch call');
    }
  }

  goToCreateAccountPage() async {
    await Future.delayed(const Duration(milliseconds: 100));
    Get.offAndToNamed(Routes.createAccountPage);
  }
}
