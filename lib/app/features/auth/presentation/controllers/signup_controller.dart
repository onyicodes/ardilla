import 'dart:async';

import 'package:ardilla/app/features/auth/domain/usecases/email_sign_up_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/google_signup_usecase.dart';
import 'package:ardilla/app/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:ardilla/core/general_widgets/custom_snackbar.dart';
import 'package:ardilla/core/parameters/signup/email_signup_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ardilla/app/routes/app_pages.dart';
import 'package:ardilla/core/constants/error_texts.dart';
import 'package:ardilla/core/parameters/signup/google_signin_params.dart';
import 'package:ardilla/core/parameters/signup/google_signup_params.dart';
import 'package:ardilla/core/parameters/signup/signin_params.dart';
import 'package:ardilla/core/validators/auth_field_validator.dart';

class AuthController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final SignupUsecase emailSignupUsecase;
  final SigninUsecase googleSignupUsecase;
  final CheckIfUserExistsUsecase checkIfUserExistsUsecase;
  final AuthFieldValidationPage authFieldValidationPage;
  final GetStorage storeBox;
  AuthController(
      {required this.emailSignupUsecase,
      required this.checkIfUserExistsUsecase,
      required this.googleSignupUsecase,
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
  final _emailError = ''.obs;
  final _countryDialCode = "234".obs;
  final _countryFlagEmoji = "🇳🇬".obs;
  final _startedTypingPw = false.obs;
  final _validPasswordField = false.obs;

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
  String get emailError => _emailError.value;
  String get countryDialCode => _countryDialCode.value;
  String get countryFlagEmoji => _countryFlagEmoji.value;
  RequestStatus get signupRequestStatus => _signupRequestStatus.value;
  RequestStatus get checkUserExistsRequestStatus =>
      _checkUserExistsRequestStatus.value;
  RequestStatus get signinRequestStatus => _signinRequestStatus.value;
  bool get startedTypingPw => _startedTypingPw.value;
  bool get validPasswordField => _validPasswordField.value;
  bool get reconnected => _reconnected.value;

  bool get has8Characters => _has8Characters.value;
  bool get hasUppercase => _hasUppercase.value;
  bool get hasLowercase => _hasLowercase.value;
  bool get hasNumber => _hasNumber.value;
  bool get hasSpecialCharacter => _hasSpecialCharacter.value;

  set obscurePasswordText(value) => _obscurePasswordText.value = value;
  set phoneError(value) => _phoneError.value = value;
  set userNameError(value) => _userNameError.value = value;
  set passwordError(value) => _passwordError.value = value;
  set emailError(value) => _emailError.value = value;
  set signupRequestStatus(value) => _signupRequestStatus.value = value;
  set checkUserExistsRequestStatus(value) =>
      _checkUserExistsRequestStatus.value = value;
  set signinRequestStatus(value) => _signinRequestStatus.value = value;
  set countryDialCode(value) => _countryDialCode.value = value;
  set countryFlagEmoji(value) => _countryFlagEmoji.value = value;
  set startedTypingPw(value) => _startedTypingPw.value = value;
  set validPasswordField(value) => _validPasswordField.value = value;

  set has8Characters(value) => _has8Characters.value = value;
  set hasUppercase(value) => _hasUppercase.value = value;
  set hasLowercase(value) => _hasLowercase.value = value;
  set hasNumber(value) => _hasNumber.value = value;
  set hasSpecialCharacter(value) => _hasSpecialCharacter.value = value;
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
        firstName: "",
        userName: userNameController.text,
        phone: phoneController.text,
        password: passwordController.text.trim(),
        lastName: countryDialCode,
        refCode: countryFlagEmoji);
    await authFieldValidationPage
        .validateEmailSignupData(params: params)
        .then((validated) async {
      if (validated) {
        if (validPasswordField) {
          final failOrSignup = await emailSignupUsecase(params);
          failOrSignup.fold((fail) {
            signupRequestStatus = RequestStatus.error;
          }, (successMessage) async {
            signupRequestStatus = RequestStatus.success;
          });
        } else {
          passwordError = AuthFieldValidationErrorMessage.passwordFormatWrong;
          customSnackbar(
              title: 'Error', message: 'Check password field requirements');
          signupRequestStatus = RequestStatus.error;
        }
      } else {
        signupRequestStatus = RequestStatus.error;
      }
    });
  }

  signinIn({required SigninParams params}) async {
    final failOrSignup = await googleSignupUsecase(params);
    failOrSignup.fold((fail) {
      signinRequestStatus = RequestStatus.error;
    }, (successMessage) async {
      customSnackbar(
          title: 'Success', message: "Continue to complete registration");
    });
  }
}
