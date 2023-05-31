import 'package:ardilla/core/constants/keys/cache_keys.dart';
import 'package:ardilla/core/models/user_model.dart';
import 'package:ardilla/core/util/initialize_get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

saveLoginData(
    {required UserModel userModel,
    required String email,
    required GetStorage storeBox,
    required String password,
    required FlutterSecureStorage secureStorage}) async {
  await initializeGetX(); // clear route and removes all controllers before logging in

  String lastUserId = userModel.id.toString();
  await storeBox.write(CacheKeys.lastUserID, lastUserId);
  await secureStorage.write(
      key: CacheKeys.loginEmail, value: email);
  await secureStorage.write(
      key: CacheKeys.password, value: password);
  await storeBox.write(CacheKeys.userData, userModel.toMap());
  await storeBox.write(CacheKeys.isLoggedIn, true);
}
