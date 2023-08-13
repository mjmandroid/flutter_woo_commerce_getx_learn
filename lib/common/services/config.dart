import 'dart:ui';

import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  Locale locale = PlatformDispatcher.instance.locale;

  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  @override
  void onReady() {
    super.onReady();
    initLocale();
    initTheme();
  }

  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(isDarkModel ? AppTheme.darkTheme : AppTheme.lightTheme);
    await Store().setBool(Constants.storageThemeCode, _isDarkModel.value);
  }

  void initTheme() async {
    var dark = Store().getBool(Constants.storageThemeCode);
    _isDarkModel.value = dark;
    Get.changeTheme(isDarkModel ? AppTheme.darkTheme : AppTheme.lightTheme);
  }

  void initLocale() {
    var langCode = Store().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales
        .indexWhere((element) => element.languageCode == langCode);
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  ///更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(locale);
    Store().setString(Constants.storageLanguageCode, value.languageCode);
  }

  ///是否首次打开
  bool get isAlreadyOpen => Store().getBool(Constants.storageAlreadyOpen);

  Future<void> setAlreadyOpen() async {
    await Store().setBool(Constants.storageAlreadyOpen, true);
  }
}
