import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /// 定义输入控制器
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  void onSign() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();
        final password = EncryptUtil().aesEncode(passwordController.text);
        final token = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: password,
        ));

        await UserService.to.setToken(token.token ?? "");

        UserService.to.getProfile();

        Get.back(result: true);
        Loading.success();
      } catch (e) {
        print(e);
      }
    }
  }
}
