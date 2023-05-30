import 'package:ardilla/app/routes/app_pages.dart';
import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:ardilla/core/general_widgets/custom_dialog_box.dart';
import 'package:ardilla/core/general_widgets/custom_snackbar.dart';
import 'package:ardilla/core/models/user_model.dart';
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
  late UserModel userModel;

  @override
  onInit() {
    super.onInit();
    sideMenuKey = GlobalKey<SideMenuState>();
    final json = storeBox.read(CacheKeys.userData);

    try {
      userModel = UserModel.fromJson(json);
    } catch (e) {
      logUserOut(storeBox: storeBox);
      Get.offAndToNamed(Routes.auth);
    }
  }

  logoutUser() async {
    Get.dialog(CustomDialogBox(
      title: "Are you sure you want to LOG OUT?",
      onTapCancel: () {
        Get.back();
      },
      onTapYes: () async {
        await logUserOut(storeBox: storeBox);
        customSnackbar(
            title: "Success", message: "You've successfully logged out");
      },
      yesBgColor: Color(0xffFCE4EB),
      yesBorderColor: Color(0xffFCE4EB),
      yesButtonTitle: "Confirm",
      yesTextColor: Color(0xffE8356D),
    ));
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
