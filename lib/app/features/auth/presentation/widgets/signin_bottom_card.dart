import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/custom_auth_field.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:ardilla/core/general_widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SigninBottomCard extends StatelessWidget {
  const SigninBottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GetBuilder<AuthController>(builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: ListView(
            children: [
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              Text(
                "Welcome!",
                style: primaryTextTheme.displayLarge,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              Text(
                "Here's how to log in to acces your account",
                style: primaryTextTheme.bodyMedium,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              GetX<AuthController>(builder: (_) {
                return CustomAuthField(
                    controller: _.signInEmailAddressController,
                    prefixIcon: SvgPicture.asset(AssetsConstants.emailIconSVG),
                    hintText: GeneralConstants.emailHint,
                    inputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _.emailEntered = value;
                      if (_.signInEmailError.isNotEmpty) {
                        _.signInEmailError = "";
                      }
                    },
                    errorText: _.signInEmailError);
              }),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              GetX<AuthController>(builder: (_) {
                return PasswordTextField(
                  controller: _.signInPasswordController,
                  errorText: _.signInPasswordError,
                  prefixIcon: SvgPicture.asset(AssetsConstants.passwordIconSVG),
                  obscurePassword: _.obscurePasswordText,
                  onChanged: (String value) {
                    if (_.signInPasswordError.isNotEmpty) {
                      _.signInPasswordError = '';
                    }
                  },
                  toggleObscureText: () {
                    _.obscurePasswordText = !_.obscurePasswordText;
                  },
                  hintText: GeneralConstants.passwordHint,
                );
              }),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 8),
                    child: Text('Forgot password',
                        style: primaryTextTheme.titleLarge)),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              Align(
                alignment: Alignment.bottomCenter,
                child: GetX<AuthController>(builder: (_) {
                  return CustomButton(
                      label: "Log in",
                      onPressed: () {
                        _.signin(
                          email: _.signInEmailAddressController.text,
                          password: _.signInPasswordController.text
                        );
                      },
                      loading: _.signinRequestStatus == RequestStatus.loading,
                      primaryTextTheme: primaryTextTheme,
                      backgroundColor: Theme.of(context).primaryColorDark,
                      borderColor: Theme.of(context).primaryColorDark,
                      textStyle: primaryTextTheme.headlineLarge!);
                }),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider())
                  ],
                ),
              ),
              CustomButton(
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).primaryColorDark,
                ),
                iconColor: Theme.of(context).primaryColor,
                primaryTextTheme: primaryTextTheme,
                label: "Sign in with SAN ID",
                onPressed: () {},
                backgroundColor: Theme.of(context).cardColor,
                borderColor: Theme.of(context).primaryColorDark,
                textStyle: primaryTextTheme.headlineLarge!,
                textColor: Theme.of(context).primaryColorDark,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New user?",
                    style: primaryTextTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        _.toSignIn = false;
                      },
                      child: Text(
                        'Create account',
                        style: primaryTextTheme.headlineLarge!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV24.value),
            ],
          ),
        ),
      );
    });
  }
}
