import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
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
      Get.offNamed(
        RouteNames.systemRegisterPin,
        arguments: UserRegisterReq(
            username: userNameController.text,
            password: passwordController.text,
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text),
      );
    }
  }

  // 登录
  void onSignIn() {
    Get.toNamed(RouteNames.login);
  }

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
