import 'package:flutter/material.dart';

class BannerIndicatorWidget extends StatelessWidget {
  final bool selected;
  const BannerIndicatorWidget({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 2,
      decoration: BoxDecoration(
          color: !selected
              ? Theme.of(context).hintColor
              : Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(90))),
    );
  }
}
