import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<SplashController>(
          id: "splash",
          builder: (context) {
            return Center(
              child: Text(controller.title),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            controller.onTab(DateTime.now().microsecondsSinceEpoch);
          },
          child: const Text("立刻点击"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Splash"),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
