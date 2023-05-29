import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/presentation/widgets/banner_card.dart';
import 'package:ardilla/app/features/home/presentation/widgets/custom_banner_indicator_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class BannerCardBuilder extends StatelessWidget {
  final Color backgroundColor;
  final int currentIndex;
  final List<CarouselEntity> carouselEntityList;
  final void Function(int index, CarouselPageChangedReason reason)
      onCarouselChange;
  const BannerCardBuilder(
      {Key? key,
      required this.backgroundColor,
      required this.currentIndex,
      required this.onCarouselChange,
      required this.carouselEntityList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: FlutterCarousel(
              items: carouselEntityList.asMap()
                  .map((k,v) => MapEntry(k, BannerCard(
                        carouselEntity: v,
                        index: k,
                      ))).values.toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height*0.3,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  onPageChanged: onCarouselChange,
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnTouch: true,
                  pauseAutoPlayOnManualNavigate: true,
                  pauseAutoPlayInFiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  disableCenter: false,
                  showIndicator: false)),
        ),
        CustomBannerIndicatorBuilder(
          carouselEntityList: carouselEntityList,
          currenIndex: currentIndex,
        ),
      ],
    );
  }
}
