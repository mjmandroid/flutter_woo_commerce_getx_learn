import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  final refreshController = RefreshController(
    initialRefresh: true,
  );

  int _page = 1;
  final int _limit = 20;

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
    // 模拟网络延迟 1 秒
    await Future.delayed(const Duration(seconds: 1));
    update(["home"]);
  }

  ///拉取商品数据
  Future<bool> _loadNewSell(bool isRefresh) async {
    var result = await ProductApi.products(ProductsReq(
      page: isRefresh ? 1 : _page,
      prePage: _limit,
    ));
    if (isRefresh) {
      _page = 1;
      newProductProductList.clear();
    }
    if (result.isNotEmpty) {
      _page++;
      newProductProductList.addAll(result);
    }
    return result.isEmpty;
  }

  void onLoading() async {
    if (newProductProductList.isEmpty) {
      refreshController.loadNoData();
    } else {
      try {
        var isEmpty = await _loadNewSell(false);
        if (isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } catch (e) {
        print(e);
        refreshController.loadFailed();
      }
    }
    update(['home_news_sell']);
  }

  void onRefresh() async {
    try {
      await _loadNewSell(true);
      refreshController.refreshCompleted();
    } catch (e) {
      print(e);
      refreshController.refreshFailed();
    }
    update(['home_news_sell']);
  }

  // 导航点击事件
  void onAppBarTap() {}

  // 分类点击事件
  void onCategoryTap(int categoryId) {}

  // ALL 点击事件
  void onAllTap(bool featured) {}

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
