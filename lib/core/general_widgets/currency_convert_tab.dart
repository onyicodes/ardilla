import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class CurrencyConvertTab extends StatelessWidget {
  final int selectedIndex;
  final String label1;
  final String label2;
  final void Function(int index) onSelectLabel;
  final Color unselectedTextColor;
  const CurrencyConvertTab(
      {super.key,
      required this.selectedIndex,
      required this.label1,
      required this.label2,
      required this.unselectedTextColor,
      required this.onSelectLabel});

  @override
  Widget build(BuildContext context) {
    return // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
// Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor

        FlutterToggleTab(
// width in percent
      width: 28,
      borderRadius: 16,
      height: 35,
      selectedIndex: selectedIndex,
      selectedBackgroundColors: const [Colors.white],
      unSelectedBackgroundColors: const [
        Color.fromRGBO(
          61,
          0,
          114,
          0.11,
        )
      ],
      selectedTextStyle: Theme.of(context).primaryTextTheme.headlineLarge!,
      unSelectedTextStyle: Theme.of(context)
          .primaryTextTheme
          .headlineLarge!
          .copyWith(color: unselectedTextColor),
      labels: [label1, label2],
      selectedLabelIndex: onSelectLabel,
      isScroll: false,
      isShadowEnable: false,
      marginSelected: EdgeInsets.only(
          left: selectedIndex == 0 ? 6 : 0,
          top: 6,
          bottom: 6,
          right: selectedIndex == 1 ? 6 : 0),
    );
  }
}
