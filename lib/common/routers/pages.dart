import 'package:flutter_woo_commerce_getx_learn/pages/login/index.dart';
import 'package:get/get.dart';

class RouterPages {
  static List<GetPage> list = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
