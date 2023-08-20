import 'package:flutter/cupertino.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:get/get.dart';

import 'main_state.dart';

class MainController extends GetxController {
  final MainState state = MainState();
  var currentIndex = 0;
  final pageController = PageController();

  void onIndexChanged(int index) {
    currentIndex = index;
    update(['navigation']);
  }

  // 切换页面
  void onJumpToPage(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void onInit() {
    super.onInit();
    UserService.to.getProfile();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
