import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/app/features/auth/presentation/widgets/password_check.dart';
import 'package:ardilla/core/constants/assets_constants.dart';

import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/custom_auth_field.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:ardilla/core/general_widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateAccountPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GetBuilder<AuthController>(
        builder: (_) => AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).cardColor,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).iconTheme.color,
                    )),
                elevation: 0,
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: ListView(
                  children: [
                    Text(
                      "Complete your profile",
                      style: primaryTextTheme.displayLarge!
                          .copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV32.value),
                    GetX<AuthController>(builder: (_) {
                      return CustomAuthField(
                          controller: _.userNameController,
                          prefixIcon:
                              SvgPicture.asset(AssetsConstants.usernameIconSVG),
                          hintText: GeneralConstants.userNameHint,
                          inputType: TextInputType.name,
                          onChanged: (value) {
                            if (_.userNameError.isNotEmpty) {
                              _.userNameError = "";
                            }
                          },
                          errorText: _.userNameError);
                    }),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV16.value),
                    GetX<AuthController>(builder: (_) {
                      return CustomAuthField(
                          controller: _.firstNameController,
                          prefixIcon: SvgPicture.asset(
                              AssetsConstants.firstNameIconSVG),
                          hintText: GeneralConstants.firstNameHint,
                          inputType: TextInputType.name,
                          onChanged: (value) {
                            if (_.firstNameError.isNotEmpty) {
                              _.firstNameError = "";
                            }
                          },
                          errorText: _.firstNameError);
                    }),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV16.value),
                    GetX<AuthController>(builder: (_) {
                      return CustomAuthField(
                          controller: _.lastNameController,
                          prefixIcon:
                              SvgPicture.asset(AssetsConstants.lastNameIconSVG),
                          hintText: GeneralConstants.lastNameHint,
                          inputType: TextInputType.name,
                          onChanged: (value) {
                            if (_.lastNameError.isNotEmpty) {
                              _.lastNameError = "";
                            }
                          },
                          errorText: _.lastNameError);
                    }),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV16.value),
                    GetX<AuthController>(builder: (_) {
                      return CustomAuthField(
                          controller: _.phoneController,
                          prefixIcon:
                              SvgPicture.asset(AssetsConstants.phoneIconSVG),
                          hintText: GeneralConstants.phoneHint,
                          inputType: TextInputType.phone,
                          onChanged: (value) {
                            if (_.phoneError.isNotEmpty) {
                              _.phoneError = "";
                            }
                          },
                          errorText: _.phoneError);
                    }),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV16.value),
                    GetX<AuthController>(builder: (_) {
                      return CustomAuthField(
                          controller: _.refCodeController,
                          prefixIcon:
                              SvgPicture.asset(AssetsConstants.refCodeIconSVG),
                          hintText: GeneralConstants.refCodeHint,
                          inputType: TextInputType.text,
                          onChanged: (value) {
                            if (_.refCodeError.isNotEmpty) {
                              _.refCodeError = "";
                            }
                          },
                          errorText: _.refCodeError);
                    }),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV16.value),
                    GetX<AuthController>(builder: (_) {
                      return PasswordTextField(
                        controller: _.passwordController,
                        errorText: _.passwordError,
                        prefixIcon:
                            SvgPicture.asset(AssetsConstants.passwordIconSVG),
                        obscurePassword: _.obscurePasswordText,
                        onChanged: (String value) {
                          _.checkPassword(text: value);
                          if (_.passwordError.isNotEmpty) {
                            _.passwordError = '';
                          }
                        },
                        validationWidget: _.startedTypingPw
                            ? PasswordCheck(
                                has8Characters: _.has8Characters,
                                hasLowercase: _.hasLowercase,
                                hasUppercase: _.hasUppercase,
                                hasNumber: _.hasNumber,
                                hasSpecialCharacter: _.hasSpecialCharacter)
                            : const SizedBox(),
                        toggleObscureText: () {
                          _.obscurePasswordText = !_.obscurePasswordText;
                        },
                        hintText: GeneralConstants.passwordHint,
                      );
                    }),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV54.value),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: TextSpan(
                                text: "By Signin Up You're agreeing to our",
                                style: primaryTextTheme.bodyLarge,
                                children: [
                              TextSpan(
                                  text: " Terms and conditions",
                                  style: primaryTextTheme.headlineMedium),
                              TextSpan(
                                  text: " and",
                                  style: primaryTextTheme.bodyLarge),
                              TextSpan(
                                  text: " Privacy Policy",
                                  style: primaryTextTheme.headlineMedium)
                            ])),
                      ),
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV24.value),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GetX<AuthController>(builder: (_) {
                        return CustomButton(
                            label: "Create Account",
                            primaryTextTheme: primaryTextTheme,
                            onPressed: () {
                              _.signup();
                            },
                            loading:
                                _.signupRequestStatus == RequestStatus.loading,
                            backgroundColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).primaryColor,
                            textStyle: primaryTextTheme.headlineLarge!);
                      }),
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV32.value),
                  ],
                ),
              ),
            )));
  }
}
