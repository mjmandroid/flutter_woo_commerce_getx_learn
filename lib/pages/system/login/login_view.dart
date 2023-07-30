import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import 'widgets/index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("login"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.state.title = "哈哈哈";
                },
                child: Text("add"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/splash");
                },
                child: Text("调到splash"),
              ),
              _buildView(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildView() {
    return const HelloWidget();
  }
}
