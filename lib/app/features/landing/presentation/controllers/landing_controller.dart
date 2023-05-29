import 'package:ardilla/core/general_widgets/custom_snackbar.dart';
import 'package:ardilla/core/util/logout_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';


class LandingController extends GetxController {
  final GetStorage storeBox;

  LandingController({required this.storeBox});

  late final GlobalKey<SideMenuState> sideMenuKey;

  final _currentPageIndex = 0.obs;
  final _screenWidth = 600.0.obs;
  final _lastExitTime = DateTime.now().obs;

  int get currentPageIndex => _currentPageIndex.value;
  double get screenWidth => _screenWidth.value;
  DateTime get lastExitTime => _lastExitTime.value;

  set currentPageIndex(value) => _currentPageIndex.value = value;
  set screenWidth(value) => _screenWidth.value = value;
  set lastExitTime(value) => _lastExitTime.value = value;

  @override
  onInit() {
    super.onInit();
    sideMenuKey = GlobalKey<SideMenuState>();
  }

  logoutUser() async {
    await logUserOut(storeBox: storeBox);
    customSnackbar(title: "Success", message: "You've successfully logged out");
  }

  toggleMenu() {
    if (sideMenuKey.currentState != null) {
      if (sideMenuKey.currentState!.isOpened) {
        sideMenuKey.currentState!.closeSideMenu();
      } else {
        sideMenuKey.currentState!.openSideMenu();
      }
    } else {
      customSnackbar(title: "Wrror", message: "sideKey null");
    }
  }

  pressToExit() {}
}
