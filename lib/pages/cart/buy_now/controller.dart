import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';

class BuyNowController extends GetxController {
  // 商品详情
  final ProductModel product;
  BuyNowController(this.product);
  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];
  // 下单 checkout
  void onCheckout() async {}
}
