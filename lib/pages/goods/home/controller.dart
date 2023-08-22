import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  void onChangeBanner(int index, CarouselPageChangedReason reason) {
    bannerCurrentIndex = index;
    update(['home_banner']);
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() async {
    // 首页
    // banner
    bannerItems = await SystemApi.banners();

    update(["home"]);
  }

  // 导航点击事件
  void onAppBarTap() {}
}
