import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:ardilla/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  final void Function() onLogout;
  final UserModel userModel;
  const CustomDrawer(
      {super.key, required this.onLogout, required this.userModel});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width*0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AssetsConstants.profilePicsPNG),
                      SizedBox(height: 16.0),
                      Text(
                        "${userModel.firstName} ${userModel.lastName}",
                        style: primaryTextTheme.displaySmall!.copyWith(color: Colors.white,),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                 CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AssetsConstants.profileIconSVG),
                  title: const Text("Profile"),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                 CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AssetsConstants.portfolioIconSVG),
                  title: const Text("Portfolio"),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                 CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AssetsConstants.paymentIconSVG),
                  title: const Text("Payment"),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                 CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),

                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AssetsConstants.investmentIconSVG),
                  title: const Text("Investment"),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  trailing: CustomButton(
                      label: "Coming soon",
                      onPressed: () {},
                      width: 80,
                      height: 30,
                      textStyle: primaryTextTheme.titleSmall,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.white,
                      primaryTextTheme: primaryTextTheme),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                 CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),

                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AssetsConstants.insurranceIconSVG),
                  title: const Text("Insurance",),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  trailing: CustomButton(
                      label: "Coming soon",
                      onPressed: () {},
                      width: 80,
                      height: 30,
                      textStyle: primaryTextTheme.titleSmall,
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.white,
                      primaryTextTheme: primaryTextTheme),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                CustomListSpacing(spacingValue: ListSpacingValue.spacingV12.value),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AssetsConstants.budgetingIconSVG),
                  title: const Text("Budgeting"),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  textColor: Colors.white,
                  dense: true,
                 
                  // padding: EdgeInsets.zero,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 54.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  onTap: onLogout,
                  leading: SvgPicture.asset(AssetsConstants.logoutIconSVG),
                  title: const Text("Logout"),
                  titleTextStyle: primaryTextTheme.titleSmall,
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
