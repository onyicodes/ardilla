import 'package:ardilla/app/features/onboarding/presentation/widgets/page_indicator_builder.dart';
import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int page;
  const OnboardingPageIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageIndicatorBuilder(selected: page == 0, currentPage:page, index :0,),
          PageIndicatorBuilder(selected: page == 1, currentPage:page, index :0,),
          PageIndicatorBuilder(selected: page == 2, currentPage:page, index :0,)
        ],
      ),
    );
  }
}
