import 'package:ardilla/app/features/onboarding/domain/entities/onboarding_content_entity.dart';
import 'package:flutter/material.dart';

class OnboardingTextWidget extends StatelessWidget {
  final OnboardContentEntity content;
  const OnboardingTextWidget({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Text(
      content.title,
      textAlign: TextAlign.center,
      style: primaryTextTheme.displayLarge,
    );
  }
}
