import 'package:ardilla/app/features/auth/presentation/controllers/signup_controller.dart';
import 'package:ardilla/app/features/auth/presentation/widgets/signin_bottom_card.dart';
import 'package:ardilla/app/features/auth/presentation/widgets/welcome_bottom_card.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).primaryColor,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsConstants.authBgPNG),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: kTextTabBarHeight),
                        height:MediaQuery.of(context).size.height*0.23,
                        child: Center(
                          child: SizedBox(
                            height: 49,
                            width: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 SvgPicture.asset(AssetsConstants.logoSVG, width: 40,),
                                 
                                SvgPicture.asset(AssetsConstants.logoTextSVG),
                                              
                              ],
                            )),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.77,
                            width: MediaQuery.of(context).size.width -34,
                            decoration: BoxDecoration(color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20))),
                            ),
                              
                           GetX<AuthController>(
                              builder: (_) {
                                return Visibility(
                                  visible: _.toSignIn,
                                  replacement:WelcomeBottomCard(),
                                  child: SigninBottomCard()  );
                              }
                            )
                          
                            
                          
                          
                        ],),
                      ),
                    ],
                  ),
            
                  //  CardSwiper(
                  //   padding: EdgeInsets.zero,
                  //   cardsCount: 2,
                  //   isLoop: true,
                  //   scale: 0.9,
            
                  //   backCardOffset: const Offset(0, 80),
                  //   numberOfCardsDisplayed: 2,
                  //   cardBuilder: (context, index) {
            
                  //       return WelcomeBottomCard();
            
                  //   },
                  // )
                ),
              ),
            )));
  }
}
