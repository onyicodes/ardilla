
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  const CategoryWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 60,
          child: SvgPicture.asset(image, height: 65, width: 60,),
        ),
       const SizedBox(height:4),
        Text(title, style: primaryTextTheme.displaySmall!.copyWith(fontSize: 14) ,)
      ],
    );
  }
}
