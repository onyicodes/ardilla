import 'package:ardilla/app/features/home/presentation/widgets/banner_indicator_widget.dart';
import 'package:flutter/material.dart';

class CustomBannerIndicatorBuilder extends StatelessWidget {
  final int currenIndex;
  final List carouselEntityList;
  const CustomBannerIndicatorBuilder(
      {super.key, required this.currenIndex, required this.carouselEntityList});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: carouselEntityList
            .asMap()
            .map((key, value) => MapEntry(
                key,
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: BannerIndicatorWidget(
                    selected: currenIndex == key,
                  ),
                )))
            .values
            .toList());
  }
}
