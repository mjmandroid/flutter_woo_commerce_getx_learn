import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/config.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/global.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/routers/index.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        splitScreenMode: false, // 支持分屏尺寸
        minTextAdapt: false, //是否根据宽度/高度中的最小值适配文字
        builder: (context, child) {
          return RefreshConfiguration(
            headerBuilder: () => ClassicHeader(),
            footerBuilder: () => ClassicFooter(),
            hideFooterWhenNotFull: true, //当列表不满一页时,是否隐藏刷新尾部
            headerTriggerDistance: 80, // 触发刷新的距离
            maxOverScrollExtent: 100, //最大拖动距离
            footerTriggerDistance: 150,
            child: GetMaterialApp(
              title: 'Flutter Demo',
              theme: ConfigService.to.isDarkModel
                  ? AppTheme.darkTheme
                  : AppTheme.lightTheme,
              builder: (context, child) {
                child = EasyLoading.init()(context, child);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },
              getPages: RouterPages.list,
              initialRoute: RouteNames.splash,
              navigatorObservers: [RouterPages.observer],
              translations: Translation(),
              localizationsDelegates: Translation.localizationDelegates,
              fallbackLocale: Translation.fallbackLocale,
              supportedLocales: Translation.supportedLocales,
              locale: ConfigService.to.locale,
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
