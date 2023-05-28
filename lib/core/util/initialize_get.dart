import 'package:ardilla/app/getx_managers/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

initializeGetX() async{
  Get.deleteAll(force: true);
   Get.put(AuthService(),permanent: true);
  Get.put(GetStorage(),permanent: true);
  Get.put(const FlutterSecureStorage(), permanent: true);
  
}