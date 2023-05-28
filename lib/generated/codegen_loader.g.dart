// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "Ardilla",
  "navBar": {
    "home": "Home",
    "voucher": "Voucher",
    "wallet": "Wallet",
    "settings": "Settings"
  },
  "error": {
    "networkError": "Connection error",
    "serverError": "Server error occurred",
    "noResultError": "Result not found",
    "accountExists": "Account exists, try logging in",
    "accountNotFound": "Account not found, sign up to continue",
    "unknownError": "an unknown error occurred",
    "forBiddenError": "you don't have permission to access this resource",
    "badRequest": "Bad request",
    "notAuthorized": "You are not authorized to perform this action",
    "cachingFailed": "Cache failure"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
