import 'dart:ui';

import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/custom_auth_field.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeBottomCard extends StatelessWidget {
  const WelcomeBottomCard({super.key});

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
                "Get Started",
                style: primaryTextTheme.displayLarge,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              Text(
                "To Create an account enter a valid email",
                style: primaryTextTheme.bodyMedium,
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
              GetX<AuthController>(builder: (_) {
                return CustomAuthField(
                    controller: _.emailAddressController,
                    prefixIcon: SvgPicture.asset(AssetsConstants.emailIconSVG),
                    hintText: GeneralConstants.emailHint,
                    inputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _.emailEntered = value;
                      if (_.emailError.isNotEmpty) {
                        _.emailError = "";
                      }
                    },
                    errorText: _.emailError);
              }),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV100.value),
              Padding(
                padding:EdgeInsets.fromViewPadding(ViewPadding.zero, 2),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GetX<AuthController>(builder: (_) {
                    return CustomButton(
                        label: "Continue",
                        onPressed: _.emailEntered.isNotEmpty
                            ? () {
                                FocusManager.instance.primaryFocus!.unfocus();
                                _.verifyEmail();
                              }
                            : null,
                        loading: _.confirmAccountEmailRequestStatus ==
                            RequestStatus.loading,
                        primaryTextTheme: primaryTextTheme,
                        backgroundColor: Theme.of(context).primaryColorDark,
                        borderColor: Theme.of(context).primaryColorDark,
                        textStyle: primaryTextTheme.headlineLarge!);
                  }),
                ),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: primaryTextTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        _.toSignIn = true;
                      },
                      child: Text(
                        'Sign in',
                        style: primaryTextTheme.headlineLarge!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
            ],
          ),
        ),
      );
    });
  }
}
