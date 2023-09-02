import 'dart:convert';

import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryController extends GetxController {
  // 分类 id , 获取路由传递参数
  int? categoryId = Get.arguments['id'];
  // 分类导航数据
  List<CategoryModel> categoryItems = [];
  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true, // 一开始就自动下拉刷新
  );
  // 列表
  List<ProductModel> items = [];
  // 页码
  int _page = 1;
  // 页尺寸
  final int _limit = 20;

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void _initData() async {
    final category = Store().getString(Constants.storageHomeCategories);
    if (category.isEmpty) {
      categoryItems = await ProductApi.categories();
    } else {
      final dataList = List<CategoryModel>.from(
          jsonDecode(category).map((e) => CategoryModel.fromJson(e)).toList());
      categoryItems.addAll(dataList);
    }
    update(['left_nav']);
  }

  Future<bool> _loadSearch(bool isSearch) async {
    final result = await ProductApi.products(ProductsReq(
      page: isSearch ? 1 : _page,
      prePage: _limit,
      category: categoryId?.toString(),
    ));
    if (isSearch) {
      _page = 1;
      items.clear();
    }
    if (result.isNotEmpty) {
      _page++;
      items.addAll(result);
    }
    return result.isEmpty;
  }

  // 上拉载入新商品
  void onLoading() async {
    if (items.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadSearch(false);

        if (isEmpty) {
          // 设置无数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (e) {
        // 加载失败
        refreshController.loadFailed();
      }
    } else {
      // 设置无数据
      refreshController.loadNoData();
    }
    update(["product_list"]);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      await _loadSearch(true);
      refreshController.refreshCompleted();
    } catch (error) {
      // 刷新失败
      refreshController.refreshFailed();
    }
    update(["product_list"]);
  }

  // 分类点击事件
  void onCategoryTap(int id) async {
    categoryId = id;
    refreshController.requestRefresh();
    update(["left_nav"]);
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
