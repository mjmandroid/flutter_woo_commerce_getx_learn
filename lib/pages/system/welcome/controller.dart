import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  List<WelcomeModel>? items;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  bool isShowStart = false;

  @override
  void onReady() {
    super.onReady();
    _initData();
    ConfigService.to.setAlreadyOpen();
  }

  void _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];
    update(['slider']);
  }

  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(["slider", "bar"]);
  }

  void onToMain() {
    Get.offAllNamed(RouteNames.main);
  }

  void onNext() {
    carouselController.nextPage();
  }
}
