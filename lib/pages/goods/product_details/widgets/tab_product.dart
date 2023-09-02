import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_details/index.dart';
import 'package:get/get.dart';

class TabProductView extends GetView<ProductDetailsPage> {
  final String uniqueTag;

  const TabProductView(this.uniqueTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("商品规格");
  }

  @override
  String? get tag => uniqueTag;
}
