import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  GetStorage storeBox = Get.find<GetStorage>();

  bool isLoggedIn() {
    bool isLoggedIn = storeBox.read<bool>(CacheKeys.isLoggedIn)??false;
    
    
    return isLoggedIn;
  }



  bool hasOnboarded() {

    bool userOnboarded =
        storeBox.read<bool>(CacheKeys.hasOnboarded) ?? false;

    return userOnboarded;
  }

 
}
