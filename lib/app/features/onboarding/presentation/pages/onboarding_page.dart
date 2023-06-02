import 'package:ardilla/app/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:ardilla/app/features/onboarding/presentation/widgets/onboarding_display_widget.dart';
import 'package:ardilla/app/features/onboarding/presentation/widgets/onboarding_page_indicator_widget.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Trans;

class OnboardingPage extends GetView<OnboardingController> {
  OnboardingPage({Key? key}) : super(key: key);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
       GetBuilder<OnboardingController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed:(){
                    _.toSigninPage();
                  }, child: Text("Skip", style: primaryTextTheme.displaySmall,),
                  ),
            );
          }
        )],),
      body: GetX<OnboardingController>(builder: (_) {
        return _.contentList.isNotEmpty
            ? ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.67,
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      controller: pageController,
                      onPageChanged: ((value) {
                        _.page = value;
                      }),
                      children: _.contentList
                          .map((e) => OnboardingDisplayWidget(
                                content: e,
                                page: _.page,
                              ))
                          .toList(),
                    ),
                  ),
                const  SizedBox(height: 50,),

                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       OnboardingPageIndicator(
                        page: _.page,
                      ),

                      GestureDetector(
                        onTap: (){
                          if (_.page != 2) {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 5),
                                curve: Curves.linear);
                          } else {
                            _.toSigninPage();
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 95,
                              height: 95,
                               decoration:  BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColorLight),
                                borderRadius:const BorderRadius.all(Radius.circular(100))),
                              child: GetX<OnboardingController>(builder: (_) {
                                  return CircularProgressIndicator(value: (_.page+1)/_.contentList.length, color: Theme.of(context).primaryColor,);
                                }
                              )),
                            Container(
                              height:65,
                              width: 65,
                              decoration:  BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:const BorderRadius.all(Radius.circular(100))),
                              child: const Icon(Icons.arrow_forward,size: 40, color: Colors.white,),),
                          ],
                        ),
                      )

                    ],),
                  ),
                 
                  
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )
            : const CircularProgressIndicator();
      }),
    );
  }
}
