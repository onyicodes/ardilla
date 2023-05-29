import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';
import 'package:ardilla/app/features/home/presentation/bindings/home_binding.dart';
import 'package:ardilla/app/features/home/presentation/controllers/home_controller.dart';
import 'package:ardilla/core/constants/assets_constants.dart';
import 'package:ardilla/core/constants/general_constants.dart';
import 'package:ardilla/core/general_widgets/button_widget.dart';
import 'package:ardilla/core/general_widgets/currency_convert_tab.dart';
import 'package:ardilla/core/general_widgets/custom_list_space.dart';
import 'package:ardilla/core/util/currency_formatter.dart';
import 'package:ardilla/core/util/currency_symbol_extractor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final hController = homeControllerSl<HomeController>();

class BannerCard extends StatelessWidget {
  final CarouselEntity carouselEntity;

  final int index;
  const BannerCard(
      {super.key, required this.carouselEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(
            carouselEntity.image,
          ),
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Positioned(
          top: 0,
          left: 24,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomListSpacing(
              spacingValue: ListSpacingValue.spacingV32.value,
            ),
            Row(
              children: [
                Text(
                  carouselEntity.title,
                  style: primaryTextTheme.headlineLarge!.copyWith(
                      color: index != 2 ? Colors.white : Color(0xff3D0072)),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (carouselEntity.change.isNotEmpty)
                  CustomButton(
                    label: carouselEntity.change,
                    onPressed: () {},
                    width: 50,
                    height: 18.6,
                    backgroundColor: Color(0xffE6356D),
                    borderColor: Color(0xffE6356D),
                    primaryTextTheme: primaryTextTheme,
                    textStyle: primaryTextTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w200),
                  )
              ],
            ),
            CustomListSpacing(
              spacingValue: index == 0
                  ? ListSpacingValue.spacingV8.value
                  : ListSpacingValue.spacingV24.value,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: GetX<HomeController>(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _.hideBalance
                          ? "*********"
                          : currencyFormatter(
                              amount: carouselEntity.amount,
                              currencySymbol: carouselEntity.currency),
                      style: primaryTextTheme.displayMedium!.copyWith(
                          color: index != 2 ? Colors.white : Color(0xff3D0072)),
                    ),
                    InkWell(
                      onTap: () {
                        _.hideBalance = !_.hideBalance;
                      },
                      child: SvgPicture.asset(
                        !_.hideBalance
                            ? AssetsConstants.viewBalanceIconSVG
                            : AssetsConstants.hideBalanceIconSVG,
                        color: index != 2
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                );
              }),
            ),
            CustomListSpacing(
              spacingValue: ListSpacingValue.spacingV16.value,
            ),
            if (index == 0)
              Text(
                "*********",
                style:
                    primaryTextTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            if (index == 0)
              Row(
                children: [
                  Text(
                    "Generate Account Number",
                    style: primaryTextTheme.bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.arrow_circle_right_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            if (index != 0)
              CustomListSpacing(
                  spacingValue: ListSpacingValue.spacingV32.value),
            if (index != 0)
              GetX<HomeController>(builder: (_) {
                return Row(
                  children: [
                    CurrencyConvertTab(
                      selectedIndex: _.currentExchangeTab,
                      unselectedTextColor: index == 1
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      onSelectLabel: (index) {
                        _.changeExchangeTab(index);
                      },
                      label1: carouselEntity.exchangeFrom,
                      label2: carouselEntity.exchangeTo,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${currencySymbolExtractor(symbol: carouselEntity.exchangeFrom)}${_.currentExchangeTab == 1 ? carouselEntity.exchangeRate : 1} /${currencySymbolExtractor(symbol: carouselEntity.exchangeTo)}${_.currentExchangeTab == 0 ? (1 / carouselEntity.exchangeRate).toStringAsFixed(3) : 1}",
                      style: primaryTextTheme.headlineSmall!.copyWith(
                          color: index == 1
                              ? Colors.white
                              : Theme.of(context).primaryColor),
                    )
                  ],
                );
              }),
          ]),
        ),
        if (index == 1)
          Positioned(
              right: 30,
              top: MediaQuery.of(context).size.height * 0.16,
              child: CustomButton(
                  width: 99,
                  height: 40,
                  radius: 100,
                  label: "Add Money",
                  textColor:
                      Theme.of(context).primaryTextTheme.displayLarge!.color!,
                  primaryTextTheme: primaryTextTheme,
                  onPressed: () {},
                  backgroundColor:
                      Theme.of(context).buttonTheme.colorScheme!.onBackground,
                  borderColor:
                      Theme.of(context).buttonTheme.colorScheme!.onBackground,
                  textStyle: primaryTextTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.w800)))
      ],
    );
  }
}
