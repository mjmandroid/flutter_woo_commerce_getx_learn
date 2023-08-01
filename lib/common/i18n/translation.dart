import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/locales/locale_en.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/locales/locale_zh.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Translation extends Translations {
  // 当前系统语言
  // static Locale? get locale => Get.deviceLocale;

  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('en', 'US');

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  static const localizationDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  Map<String, Map<String, String>> get keys => {'en': localeEn, 'zh': localeZh};
}
