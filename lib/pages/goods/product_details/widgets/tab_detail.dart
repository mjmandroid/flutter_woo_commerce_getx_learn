import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_details/index.dart';
import 'package:get/get.dart';

class TabDetailView extends GetView<ProductDetailsController> {
  final String uniqueTag;
  const TabDetailView(this.uniqueTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("商品详情");
  }

  @override
  String? get tag => super.tag;
}
