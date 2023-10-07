import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  // 优惠券控制器
  TextEditingController couponController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    couponController.dispose();
  }
}
