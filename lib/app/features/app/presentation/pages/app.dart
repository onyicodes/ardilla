import 'package:ardilla/app/routes/app_pages.dart';
import 'package:ardilla/app/theme/app_theme.dart';
import 'package:ardilla/core/general_widgets/custom_loading_loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      theme: ArdillaAppTheme.light(),
      themeMode: ThemeMode.light,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: context.locale,
      navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(
            loadingBuilder: (String msg) =>
                const CustomLoadingIndicator(loadingMessage: 'loadingMessage'),
          ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
