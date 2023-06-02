import 'package:ardilla/app/routes/app_pages.dart';
import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:ardilla/core/util/CustomSmartLoading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

logUserOut({required GetStorage storeBox}) async {
  

  customSmartLoading(loading: true, message: "logging out..");

  await Future.delayed(const Duration(seconds: 2));
  await storeBox.write(CacheKeys.isLoggedIn, false);

  Get.offAllNamed(Routes.auth);
  customSmartLoading(loading: false, message: "logging out..");
}
