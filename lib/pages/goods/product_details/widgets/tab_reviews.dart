import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_details/index.dart';
import 'package:get/get.dart';

class TabReviewsView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabReviewsView(this.uniqueTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('评论');
  }

  @override
  String? get tag => uniqueTag;
}
