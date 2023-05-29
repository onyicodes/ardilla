import 'package:ardilla/app/features/home/presentation/controllers/home_controller.dart';
import 'package:ardilla/app/features/home/presentation/widgets/banner_card_builder.dart';
import 'package:ardilla/app/features/home/presentation/widgets/category_builder_widget.dart';
import 'package:ardilla/app/features/home/presentation/widgets/loaders/banner_loader.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, kToolbarHeight),
              child: GetBuilder<HomeController>(builder: (_) {
                return ListTile(
                  leading: InkWell(
                      onTap: () {
                        _.toggleMenu();
                      },
                      child: CircleAvatar()),
                  title: Text(
                    "Good Morning. ",
                    style: primaryTextTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    "Cadet<Annie/>",
                    style: primaryTextTheme.displaySmall,
                  ),
                  trailing: Icon(Icons.notification_add),
                );
              })),
          body:ListView(
            children: [
              GetX<HomeController>(builder: (_) {
                      return _.carouselRequestStatus == RequestStatus.success
                          ? BannerCardBuilder(
                              currentIndex: _.currentCarouselIndex,
                              onCarouselChange: ((index, reason) {
                                _.currentCarouselIndex = index;
                              }),
                              backgroundColor: Colors.white,
                              carouselEntityList: _.carouselsList,
                            )
                          : _.carouselRequestStatus == RequestStatus.loading
                              ? const BannerLoaderWidget()
                              : const SizedBox.shrink();
                    }),
                    CustomListSpacing(spacingValue: ListSpacingValue.spacingV24.value),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Text("Quick Links",style: primaryTextTheme.displaySmall!.copyWith(fontWeight: FontWeight.normal),),
                  ),
                 GetX<HomeController>(builder: (_) {
                    return _.categoriesRequestStatus == RequestStatus.success?
                    CategoryBuilderWidget(
                                              categoryEntityList: _.categoriesList): const SizedBox.shrink();
                  }
                )
              
            ],
          )),
    );
  }
}
