import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyEmailPage extends GetView<AuthController> {
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
                  ),
                ),
                elevation: 0,
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                        height: 256,
                        child: Image.asset(AssetsConstants.verifyEmailPNG)),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV48.value),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Verify your email address",
                            textAlign: TextAlign.center,
                            style: primaryTextTheme.displayLarge,
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                            label: "Open Email App",
                            primaryTextTheme: primaryTextTheme,
                            onPressed: () {
                              _.openEmailApp();
                            },
                            backgroundColor: Theme.of(context).cardColor,
                            textColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).primaryColor,
                            textStyle: primaryTextTheme.headlineLarge!),
                      ),
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV24.value),
                    Builder(
                      builder: (context) {
                        return CustomButton(
                            label: "Continue",
                            primaryTextTheme: primaryTextTheme,
                            onPressed: () {
                              _.goToCreateAccountPage();
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).primaryColor,
                            textStyle: primaryTextTheme.headlineLarge!);
                      }
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV32.value),
                  ],
                ),
              ),
            )));
  }
}
