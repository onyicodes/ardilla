import 'package:ardilla/app/features/home/presentation/controllers/home_controller.dart';
import 'package:ardilla/app/features/home/presentation/widgets/banner_builder.dart';
import 'package:ardilla/app/features/home/presentation/widgets/banner_card.dart';
import 'package:ardilla/app/features/home/presentation/widgets/benefits_card.dart';
import 'package:ardilla/app/features/home/presentation/widgets/custom_banner_indicator_builder.dart';
import 'package:ardilla/app/features/home/presentation/widgets/flow_chart_builder.dart';
import 'package:ardilla/app/features/home/presentation/widgets/category_builder_widget.dart';
import 'package:ardilla/app/features/home/presentation/widgets/footer_card.dart';
import 'package:ardilla/app/features/home/presentation/widgets/loaders/banner_loader.dart';
import 'package:ardilla/app/features/home/presentation/widgets/rank_banner_indicator_builder%20copy.dart';
import 'package:ardilla/app/features/home/presentation/widgets/rank_card.dart';
import 'package:ardilla/app/features/home/presentation/widgets/video_player_widget.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: GetBuilder<HomeController>(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 80,
                elevation: 0,
                leading: InkWell(
                    onTap: () {
                      _.toggleMenu();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AssetsConstants.profilePicsPNG),
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _.greeting,
                      style: primaryTextTheme.bodyMedium,
                    ),
                    Text(
                      "${_.usermodel.rank.isNotEmpty ? _.usermodel.rank : RankType.Cadet.name}<${_.usermodel.userName}/>",
                      style: primaryTextTheme.displaySmall,
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SvgPicture.asset(AssetsConstants.notificationIconSVG),
                  ),
                ],
              ),
              body: ListView(
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                children: [
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV8.value),
                  GetX<HomeController>(builder: (_) {
                    return _.carouselRequestStatus == RequestStatus.success
                        ? BannerBuilder(
                            currentIndex: _.currentCarouselIndex,
                            onCarouselChange: ((index, reason) {
                              _.currentCarouselIndex = index;
                            }),
                            cardbuilder: (entity, index) {
                              return BannerCard(
                                  carouselEntity: entity, index: index);
                            },
                            indicatorBuilder: CustomBannerIndicatorBuilder(
                                currenIndex: _.currentCarouselIndex,
                                carouselEntityList: _.carouselsList),
                            backgroundColor: Colors.white,
                            carouselEntityList: _.carouselsList,
                          )
                        : _.carouselRequestStatus == RequestStatus.loading
                            ? const BannerLoaderWidget()
                            : const SizedBox.shrink();
                  }),
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV32.value),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("80%",
                                    style: primaryTextTheme.displayMedium!
                                        .copyWith(
                                            color: primaryTextTheme
                                                .bodyLarge!.color,
                                            fontWeight: FontWeight.w200)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Complete KYC",
                                        style: primaryTextTheme.titleMedium),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16,
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100))),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: const BorderRadius.all(
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: GetX<HomeController>(builder: (_) {
                                return _.cashFlowRequestStatus ==
                                            RequestStatus.success &&
                                        _.cashFlowModel != null
                                    ? LineBuilder(
                                        cashFlowModel: _.cashFlowModel!,
                                      )
                                    : const SizedBox();
                              }))
                        ],
                      ),
                    ),
                  ),
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV48.value),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            _.benefitsCarouselController.previousPage();
                          },
                          child: Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white54),
                              child: const Center(
                                  child: Icon(Icons.arrow_back_ios_rounded))),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            _.benefitsCarouselController.nextPage();
                          },
                          child: Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white54),
                              child:
                                  const Icon(Icons.arrow_forward_ios_rounded)),
                        )
                      ],
                    ),
                  ),
                  GetX<HomeController>(builder: (_) {
                    return _.carouselRequestStatus == RequestStatus.success
                        ? BannerBuilder(
                            currentIndex: _.currentBenefitsIndex,
                            onCarouselChange: ((index, reason) {
                              _.currentBenefitsIndex = index;
                            }),
                            viewPortFraction: 0.9,
                            controller: _.benefitsCarouselController,
                            cardbuilder: ((entity, index) {
                              return BenefitsCard(benefitsModel: entity);
                            }),
                            indicatorBuilder: const SizedBox.shrink(),
                            backgroundColor: Colors.white,
                            carouselEntityList: _.benefitsModelList,
                          )
                        : _.carouselRequestStatus == RequestStatus.loading
                            ? const BannerLoaderWidget()
                            : const SizedBox.shrink();
                  }),
                  GetX<HomeController>(builder: (_) {
                    return _.carouselRequestStatus == RequestStatus.success
                        ? BannerBuilder(
                            currentIndex: _.currentRanksIndex,
                            onCarouselChange: ((index, reason) {
                              _.currentRanksIndex = index;
                            }),
                            cardbuilder: ((entity, index) {
                              return RankCard(rankModel: entity, index: index);
                            }),
                            viewPortFraction: 0.9,
                            indicatorBuilder: RankBannerIndicatorBuilder(
                              carouselEntityList: _.ranksModelList,
                              currenIndex: _.currentRanksIndex,
                            ),
                            backgroundColor: Colors.white,
                            carouselEntityList: _.ranksModelList,
                          )
                        : _.carouselRequestStatus == RequestStatus.loading
                            ? const BannerLoaderWidget()
                            : const SizedBox.shrink();
                  }),
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV48.value),
                  GetBuilder<HomeController>(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: VideoPlayerWidget(
                          controller: _.videoPlayerController,
                          videoModel: _.videoModel),
                    );
                  }),
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV48.value),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Explore",
                      style: primaryTextTheme.displaySmall,
                    ),
                  ),
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV16.value),
                  GetBuilder<HomeController>(builder: (_) {
                    return SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 250,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        AssetsConstants.exploreBgPNG),
                                    fit: BoxFit.cover,
                                    repeat: ImageRepeat.repeatX)),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: _.footerModelList.length,
                                separatorBuilder: ((context, index) {
                                  return Divider(
                                    thickness: 6,
                                    height: 20,
                                    color: Theme.of(context).cardColor,
                                  );
                                }),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      FooterCard(
                                          footerModel: _.footerModelList[index],
                                          index: index),
                                      if (_.footerModelList.length != index + 1)
                                        Container(
                                          height: 86,
                                          width: 1,
                                          color: Colors.white,
                                        )
                                    ],
                                  );
                                }),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    );
                  }),
                  CustomListSpacing(
                      spacingValue: ListSpacingValue.spacingV32.value)
                ],
              ));
        }),
      ),
    );
  }
}
