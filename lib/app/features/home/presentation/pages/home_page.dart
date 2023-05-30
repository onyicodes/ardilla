import 'package:ardilla/app/features/home/presentation/controllers/home_controller.dart';
import 'package:ardilla/app/features/home/presentation/widgets/benefits_card.dart';
import 'package:ardilla/app/features/home/presentation/widgets/flow_chart_builder.dart';
import 'package:ardilla/app/features/home/presentation/widgets/banner_card_builder.dart';
import 'package:ardilla/app/features/home/presentation/widgets/category_builder_widget.dart';
import 'package:ardilla/app/features/home/presentation/widgets/loaders/banner_loader.dart';
import 'package:ardilla/app/features/home/presentation/widgets/rank_card.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:fl_chart/fl_chart.dart';
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
                    "${_.usermodel.rank.isNotEmpty ? _.usermodel.rank : RankType.Cadet.name}<${_.usermodel.userName}/>",
                    style: primaryTextTheme.displaySmall,
                  ),
                  trailing: Icon(Icons.notification_add),
                );
              })),
          body: ListView(
            children: [
              CustomListSpacing(spacingValue: ListSpacingValue.spacingV8.value),
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
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV24.value),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Quick Links",
                  style: primaryTextTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              GetX<HomeController>(builder: (_) {
                return _.categoriesRequestStatus == RequestStatus.success
                    ? CategoryBuilderWidget(
                        categoryEntityList: _.categoriesList)
                    : const SizedBox.shrink();
              }),
              CustomListSpacing(
                spacingValue: ListSpacingValue.spacingV16.value,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.27,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("80%",
                                style: primaryTextTheme.displayMedium!.copyWith(
                                    color: primaryTextTheme.bodyLarge!.color,
                                    fontWeight: FontWeight.w200)),
                            Row(
                              children: [
                                Text("Complete KYC",
                                    style: primaryTextTheme.titleLarge),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                )
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: 70,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                ),
                                Container(
                                  width: 50,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                      ),
                      SizedBox(
                          height: 96,
                          width: MediaQuery.of(context).size.width * 0.63,
                          child: GetX<HomeController>(builder: (_) {
                            return _.cashFlowRequestStatus ==
                                        RequestStatus.success &&
                                    _.cashFlowModel != null
                                ? LineChartSample1(
                                    cashFlowModel: _.cashFlowModel!,
                                  )
                                : SizedBox();
                          }))
                    ],
                  ),
                ),
              ),
              GetX<HomeController>(builder: (_) {
                return _.benefitsRequestStatus == RequestStatus.success
                    ? SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _.benefitsModelList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                            child: BenefitsCard(benefitsModel: _.benefitsModelList[index]),
                          );
                        }),
                    )
                    :const SizedBox.shrink();
              }),
              GetX<HomeController>(builder: (_) {
                return _.ranksRequestStatus == RequestStatus.success
                    ? SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _.ranksModelList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                            child: RankCard(rankModel: _.ranksModelList[index]),
                          );
                        }),
                    )
                    :const SizedBox.shrink();
              }),

              GetX<HomeController>(builder: (_) {
                return _.ranksRequestStatus == RequestStatus.success
                    ? SizedBox(
                      height: 265,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/explore_bg.png',
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _.ranksModelList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                                child: RankCard(rankModel: _.ranksModelList[index]),
                              );
                            }),
                        ],
                      ),
                    )
                    :const SizedBox.shrink();
              })
            ],
          )),
    );
  }
}
