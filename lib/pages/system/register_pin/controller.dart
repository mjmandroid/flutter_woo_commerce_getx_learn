import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:get/get.dart';

class RegisterPinController extends GetxController {
  final pinController = TextEditingController();

  GlobalKey globalKey = GlobalKey<FormState>();

  // pin 触发提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");
  }

  // 按钮提交
  void onBtnSubmit() {
    Loading.show("加载中");
  }

  // 按钮返回
  void onBtnBackup() {
    Get.back();
  }

  // 验证 pin
  String? pinValidator(val) {
    return val == '111111'
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
  }
}
