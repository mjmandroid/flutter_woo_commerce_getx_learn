import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StylesIndexController extends GetxController {
  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController unameController =
      TextEditingController(text: "ducafecat");
  TextEditingController pwdController = TextEditingController(text: "123456");

  @override
  void dispose() {
    super.dispose();
    unameController.dispose();
    pwdController.dispose();
  }
}
