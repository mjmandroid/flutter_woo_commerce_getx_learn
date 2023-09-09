import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  // 排序列表
  List<KeyValueModel> orderList = [
    KeyValueModel(key: "rating", value: "Best Match"),
    KeyValueModel(key: "price_low", value: "Price (low to high)"),
    KeyValueModel(key: "price_high", value: "Price (high to low)"),
    KeyValueModel(key: "popularity", value: "Popularity"),
    KeyValueModel(key: "date", value: "New publish"),
    KeyValueModel(key: "title", value: "Product name"),
    KeyValueModel(key: "slug", value: "Slug name"),
  ];
  // 排序选中
  KeyValueModel orderSelected =
      KeyValueModel(key: "rating", value: "Best Match");

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // 价格范围 0~1000
  final List<double> priceRange = [100, 1000];

  // 排序选中
  void onOrderTap(KeyValueModel? val) {
    orderSelected = val!;
    update(["search_filter"]);
  }

  void onFilterOpenTap() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  // 价格区间拖动
  void onPriceRangeDragging(
    int handlerIndex,
    dynamic lowerValue,
    dynamic upperValue,
  ) {
    print("----$lowerValue  $upperValue");
    priceRange[0] = lowerValue as double;
    priceRange[1] = upperValue as double;
    update(["filter_price_range"]);
  }

  // 筛选 关闭
  void onFilterCloseTap() {
    Get.back();
  }
}
