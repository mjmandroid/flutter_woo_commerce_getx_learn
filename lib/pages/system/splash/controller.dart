import 'package:flutter_woo_commerce_getx_learn/common/routers/names.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      if (!ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.welcome);
      } else {
        Get.offAllNamed(RouteNames.main);
      }
    });
  }
}
