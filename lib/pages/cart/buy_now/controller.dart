import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';

class BuyNowController extends GetxController {
  // 商品详情
  final ProductModel product;

  // 送货地址
  String shippingAddress = "";

  int quantity = 1;
  // 运费
  double get shipping => 0;
  // 折扣
  double get discount => 0;

  double get totalPrice => double.parse(product.price!) * quantity;

  BuyNowController(this.product);

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 下单 checkout
  void onCheckout() async {}

  void _initData() {
    shippingAddress = UserService.to.shipping;
    update(["buy_now"]);
  }

  Future<void> onShippingTap() async {
    var result = await Get.toNamed(
      RouteNames.myMyAddress,
      arguments: {"type": "Shipping"},
    );
    if (result != null && result == true) {
      shippingAddress = UserService.to.shipping;
      update(["buy_now"]);
    }
  }

  // 修改数量
  void onQuantityChange(int value) {
    if (value <= 0) {
      value = 1;
    }
    quantity = value;
    update(["buy_now"]);
  }
}
