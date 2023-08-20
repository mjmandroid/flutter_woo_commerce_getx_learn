import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:get/get.dart';

import 'main_state.dart';

class MainController extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    super.onInit();
    UserService.to.getProfile();
  }
}
