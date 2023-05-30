import 'package:ardilla/app/features/splash/presentation/controllers/splash_screen_controller.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
     builder:(_)=> Scaffold(
        extendBodyBehindAppBar: true,
        body:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstants.splashScreenBgPNG),
                fit: BoxFit.fill,
              ),
            ),
          child: Align(
              alignment: Alignment.center,
              child:SizedBox(
                width: 144,
                height: 156,
                child:  SvgPicture.asset(
                                      AssetsConstants.logoSVG,
                                      ))),
        ),
      ),
    );
  }
}
