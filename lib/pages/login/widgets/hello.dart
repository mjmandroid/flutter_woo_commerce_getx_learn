import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/login/login_controller.dart';
import 'package:get/get.dart';

class HelloWidget extends GetView<LoginController> {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(controller.state.title));
  }
}
