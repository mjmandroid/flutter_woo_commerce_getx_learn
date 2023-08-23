import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];
  // 分类导航数据
  List<CategoryModel> categoryItems = [];
  // 推荐商品列表数据
  List<ProductModel> flashShellProductList = [];
  // 最新商品列表数据
  List<ProductModel> newProductProductList = [];

  void onChangeBanner(int index, CarouselPageChangedReason reason) {
    bannerCurrentIndex = index;
    update(['home_banner']);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void _initData() async {
    // 首页
    // banner
    bannerItems = await SystemApi.banners();
    // 分类
    categoryItems = await ProductApi.categories();
    // 推荐商品
    flashShellProductList =
        await ProductApi.products(ProductsReq(featured: true));
    // 新商品
    newProductProductList = await ProductApi.products(ProductsReq());
    update(["home"]);
  }

  // 导航点击事件
  void onAppBarTap() {}
}
