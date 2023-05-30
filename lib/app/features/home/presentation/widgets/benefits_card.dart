import 'package:ardilla/app/features/home/data/model/benefits_model.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';

class BenefitsCard extends StatelessWidget {
  final BenefitsModel benefitsModel;
  const BenefitsCard({super.key, required this.benefitsModel});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          image: DecorationImage(image: AssetImage(benefitsModel.bgImage))),
      child: Column(
        children: [
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV54.value),
          Image(image: AssetImage(benefitsModel.icon)), 
          CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Text(benefitsModel.label, textAlign: TextAlign.center, style:primaryTextTheme.displaySmall,),
        ),
        CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
         Text(benefitsModel.title, style: primaryTextTheme.bodyLarge,),
         CustomListSpacing(spacingValue: ListSpacingValue.spacingV16.value),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(benefitsModel.subTitle, style: primaryTextTheme.headlineMedium,),
              SizedBox(width: 4,),
              Icon(Icons.arrow_forward_rounded, size: 25,)
            ],
          )
        ],
      ),
    );
  }
}
