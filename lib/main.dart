import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/config.dart';
import 'package:flutter_woo_commerce_getx_learn/global.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RouterPages.list,
      initialRoute: RouteNames.main,
      navigatorObservers: [RouterPages.observer],
      translations: Translation(),
      localizationsDelegates: Translation.localizationDelegates,
      fallbackLocale: Translation.fallbackLocale,
      locale: ConfigService.to.locale,
    );
  }
}
