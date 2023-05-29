import 'dart:ui';

import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final String loadingMessage;
  const CustomLoadingIndicator({Key? key, required this.loadingMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 55,
                  height: 55,
                  child: LoadingAnimationWidget.discreteCircle(
                      color: Theme.of(context).primaryColor,
                      size: 100,
                      thirdRingColor: const Color(0xff1DCDFE)),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset(AssetsConstants.logoSVG, width: 40,),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                loadingMessage,
                style: primaryTextTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
