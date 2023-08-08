import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/splash/view.dart';
import 'package:get/get.dart';

import '../../pages/system/main/index.dart';
import 'index.dart';

class RouterPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<GetPage> list = [
    GetPage(
      name: RouteNames.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: RouteNames.main,
      page: () => MainPage(),
    )
  ];
}
