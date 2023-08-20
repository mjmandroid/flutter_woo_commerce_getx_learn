import 'package:flutter_woo_commerce_getx_learn/pages/cart/cart_index/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/home/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/msg/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/my/my_index/index.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartIndexController>(() => CartIndexController());
    Get.lazyPut<MsgIndexController>(() => MsgIndexController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
  }
}
