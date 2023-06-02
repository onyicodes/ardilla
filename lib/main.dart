import 'package:ardilla/app/features/app/presentation/pages/app.dart';
import 'package:ardilla/core/util/initialize_get.dart';
import 'package:ardilla/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
 await initializeGetX();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en')],
      path:
          'assets/translations/', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const App()));
}
