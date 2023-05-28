import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Future<dynamic> customSnackbar(
    {required String title,
    required String message,
    int duration = 3,
    bool isError = false,
    Widget? icon,
    void Function(GetSnackBar snackBar)? onTap,
    SnackPosition snackPosition = SnackPosition.TOP,
    Color overlayColor = Colors.deepPurple}) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, message,
    colorText: Colors.white,
        icon: icon ?? (isError
            ? Image.asset(
                AssetsConstants.unknownErrorImage,
                width: 100,
              )
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(AssetsConstants.logoSVG,width: 30,height: 30,),
              )),
        onTap: onTap,
        duration: Duration(seconds: duration),
        backgroundColor: isError ? Colors.red.shade100 : overlayColor,
        snackPosition: snackPosition);
  }
  return Future.delayed(Duration(seconds: duration));
}
