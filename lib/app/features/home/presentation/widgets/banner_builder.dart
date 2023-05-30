import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class BannerBuilder extends StatelessWidget {
  final Color backgroundColor;
  final int currentIndex;
  final Widget Function(dynamic entity, int index) cardbuilder;
  final Widget indicatorBuilder;
  final CarouselController? controller;
  final List<dynamic> carouselEntityList;
  final double viewPortFraction;
  final double height;
  final void Function(int index, CarouselPageChangedReason reason)
      onCarouselChange;
  const BannerBuilder(
      {Key? key,
      required this.backgroundColor,
      required this.currentIndex,
      required this.indicatorBuilder,
      this.controller,
      this.height = 300,
      required this.cardbuilder,
      this.viewPortFraction = 1.0,
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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: FlutterCarousel(
              items: carouselEntityList
                  .asMap()
                  .map((k, v) => MapEntry(k, cardbuilder(v, k)))
                  .values
                  .toList(),
              options: CarouselOptions(
                  height: height,
                  aspectRatio: 16 / 9,
                  viewportFraction: viewPortFraction,
                  controller: controller,
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
        indicatorBuilder
      ],
    );
  }
}
