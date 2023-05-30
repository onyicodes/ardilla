import 'package:ardilla/app/features/home/data/model/footer_model.dart';
import 'package:ardilla/app/features/home/data/model/rank_model.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';

class FooterCard extends StatelessWidget {
  final FooterModel footerModel;
  final int index;
  const FooterCard({super.key, required this.footerModel, required this.index});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Container(
      height: 240,
      padding: EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width*0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomListSpacing(
              spacingValue: ListSpacingValue.spacingV16.value),
          Text(
            footerModel.title,
            textAlign: TextAlign.center,
            style: primaryTextTheme.displayMedium!.copyWith(color: Colors.white),
          ),
          CustomListSpacing(
              spacingValue: ListSpacingValue.spacingV24.value),
          
         SizedBox(
          width: MediaQuery.of(context).size.width*0.6,
           child: Text(
             footerModel.subtitle,
             textAlign: TextAlign.center,
             style: primaryTextTheme.titleLarge!.copyWith(color: Colors.white),
           ),
         ),
          CustomListSpacing(
              spacingValue: ListSpacingValue.spacingV24.value),
         
          CustomButton(
            width: 120,
            height: 45,
            label: "Coming Soon", onPressed: (){

          }, backgroundColor:Colors.transparent, borderColor: Colors.white, primaryTextTheme: primaryTextTheme, textStyle: primaryTextTheme.bodyMedium,)
        ],
      ),
    );
  }
}
