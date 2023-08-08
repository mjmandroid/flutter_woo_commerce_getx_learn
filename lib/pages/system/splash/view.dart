import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/images.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/image.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/splash/controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return ImageWidget.asset(
      AssetsImages.splashJpg,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return _buildView();
      },
    );
  }
}
