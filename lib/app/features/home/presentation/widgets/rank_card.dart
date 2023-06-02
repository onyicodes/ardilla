import 'package:ardilla/app/features/home/data/model/rank_model.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';

class RankCard extends StatelessWidget {
  final RankModel rankModel;
  final int index;
  const RankCard({super.key, required this.rankModel, required this.index});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            rankModel.heading,
            style: primaryTextTheme.displayMedium,
          ),
        ),
        Container(
          height: 240,
          padding: EdgeInsets.all(40),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              image: DecorationImage(image: AssetImage(rankModel.bgImage))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              Text(
                rankModel.title,
                textAlign: TextAlign.center,
                style: primaryTextTheme.displaySmall!
                    .copyWith(color:index==0? Color(0xffE8356D): Theme.of(context).primaryColor),
              ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV16.value),
              
             SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
               child: Text(
                 rankModel.subTitle,
                 style: primaryTextTheme.titleLarge,
               ),
             ),
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
             
             if(index>1)
             Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Click here", style: primaryTextTheme.headlineMedium,),
              SizedBox(width: 4,),
              Icon(Icons.arrow_forward_rounded, size: 25,)
            ],
          )
            ],
          ),
        ),
      ],
    );
  }
}
