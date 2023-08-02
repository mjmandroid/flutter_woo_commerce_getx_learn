import 'dart:ui';

import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

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
    // TODO: implement onReady
    super.onReady();
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
}
