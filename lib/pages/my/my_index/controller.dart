import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/main/main_controller.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  void onLogout() {
    UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }
}
