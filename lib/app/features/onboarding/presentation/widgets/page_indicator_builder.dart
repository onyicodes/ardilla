import 'package:flutter/material.dart';

class PageIndicatorBuilder extends StatelessWidget {
  const PageIndicatorBuilder(
      {super.key, required this.selected, required this.currentPage, required this.index});
  final bool selected;
  final int currentPage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: selected ? 29 : 7,
        height: 7,
        decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).primaryColor
                :  Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
    );
  }
}
