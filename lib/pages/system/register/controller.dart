import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "ducafecat5@gmail.com");
  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "ducafe");
  // 名
  TextEditingController lastNameController = TextEditingController(text: "cat");
  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  GlobalKey globalKey = GlobalKey<FormState>();
  // 注册
  void onSignUp() {
    if ((globalKey.currentState as FormState).validate()) {
      // 验证通过提交数据
      Get.toNamed(RouteNames.systemRegisterPin);
    }
  }

  // 登录
  void onSignIn() {}
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
