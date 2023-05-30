import 'package:ardilla/app/features/home/presentation/widgets/banner_indicator_widget.dart';
import 'package:flutter/material.dart';

class RankBannerIndicatorBuilder extends StatelessWidget {
  final int currenIndex;
  final List carouselEntityList;
  const RankBannerIndicatorBuilder(
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
                  child: Container(
                      width:key== currenIndex? 30: (currenIndex-key).abs() ==1?8.4 :6,
                      height: key== currenIndex? 10: (currenIndex-key).abs()==1?8.4 :6,
                      decoration: BoxDecoration(
                          color: key== currenIndex
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorLight,
                          borderRadius: const BorderRadius.all(Radius.circular(90))),
                    ),
                )))
            .values
            .toList());
  }
}
