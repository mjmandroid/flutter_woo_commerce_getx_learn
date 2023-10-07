import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/cart/buy_done/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/category/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_details/view.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_list/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/my/my_address/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/search/search_filter/view.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/search/search_index/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/styles/styles_index/view.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/login/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/register/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/register_pin/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/splash/view.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/welcome/index.dart';
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
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteNames.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.text_form,
      page: () => StylePage(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteNames.systemRegisterPin,
      page: () => RegisterPinPage(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteNames.goodsProductList,
      page: () => ProductListPage(),
    ),
    GetPage(
      name: RouteNames.goodsCategory,
      page: () => CategoryPage(),
    ),
    GetPage(
      name: RouteNames.goodsProductDetails,
      page: () => ProductDetailsPage(),
    ),
    GetPage(
      name: RouteNames.searchSearchIndex,
      page: () => SearchIndexPage(),
    ),
    GetPage(
      name: RouteNames.searchFilter,
      page: () => SearchFilterPage(),
    ),
    GetPage(
      name: RouteNames.myMyAddress,
      page: () => MyAddressPage(),
    ),
    GetPage(
      name: RouteNames.cartBuyDone,
      page: () => BuyDonePage(),
    )
  ];
}
