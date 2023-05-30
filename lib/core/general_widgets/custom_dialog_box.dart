import 'dart:ui';

import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String yesButtonTitle;
  final String? middleButtonTitle;
  final void Function()? onMiddleButtonTap;
  final void Function() onTapYes;
  final void Function() onTapCancel;
  final Color middleButtonBorderColor;
  final Color middleButtonBgColor;
  final Color yesBorderColor;
  final Color yesBgColor;
  final Color? yesTextColor;
  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.onTapCancel,
    required this.onTapYes,
    required this.yesBgColor,
    required this.yesBorderColor,
    this.yesTextColor,
    this.middleButtonBorderColor = Colors.grey,
    this.middleButtonBgColor = Colors.grey,
    this.yesButtonTitle = "Yes",
    this.middleButtonTitle,
    this.onMiddleButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: primaryTextTheme.headlineLarge,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                      label: yesButtonTitle,
                      onPressed: onTapYes,
                      width: 120,
                      radius: 8,
                      textColor:  yesTextColor??Colors.white ,
                      backgroundColor: yesBgColor,
                      borderColor: yesBorderColor,
                      primaryTextTheme: primaryTextTheme),
                ),
                
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                      label: 'Cancel',
                      onPressed: onTapCancel,
                      width: 120,
                      radius: 8,
                      borderColor: Theme.of(context).shadowColor,
                      backgroundColor: Theme.of(context).cardColor,
                      textColor: primaryTextTheme.displayLarge!.color!,
                      primaryTextTheme: primaryTextTheme),
                ),
               ],),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
