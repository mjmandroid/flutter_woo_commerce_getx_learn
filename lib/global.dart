import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:get/get.dart';

import 'common/services/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Store().init();
    await Future.wait([
      Get.putAsync(() async => ConfigService().init()),
      Get.putAsync(() async => WPHttpService()),
      Get.putAsync(() async => UserService()),
    ]).whenComplete(() => {});

    Loading();
    setSystemUi();
  }

  static void setSystemUi() {
    if (GetPlatform.isMobile) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    if (GetPlatform.isAndroid) {
      const style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // 该属性仅用于 iOS 设备顶部状态栏亮度
        // statusBarBrightness: Brightness.light,
        // 顶部状态栏图标的亮度
        // statusBarIconBrightness: Brightness.light,
        // 底部状态栏颜色
        systemNavigationBarColor: Colors.white,
        // 底部状态栏与主内容分割线颜色
        systemNavigationBarDividerColor: Colors.transparent,
        // 底部状态栏图标样式
        statusBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }
}
