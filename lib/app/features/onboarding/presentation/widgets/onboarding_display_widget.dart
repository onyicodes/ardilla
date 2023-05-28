import 'package:ardilla/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingDisplayWidget extends StatelessWidget {
  final OnboardContentEntity content;
  final int page;
  const OnboardingDisplayWidget({Key? key, required this.content, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child:SvgPicture.asset(content.imageUrl),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 8),
              child: Text(
                content.title,
                textAlign: TextAlign.center,
                style: primaryTextTheme.displayMedium!.copyWith(fontSize: 30, color: Theme.of(context).primaryColorDark),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0, vertical: 8.0),
              child: Text(
                content.subtitle,
                textAlign: TextAlign.center,
                style: primaryTextTheme.bodyMedium!.copyWith(color: Colors.grey.shade500),
              ),
            ),
          ],
        ));
  }
}
