import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  Widget _builderSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: controller,
      builder: (controller) {
        return controller.items == null
            ? const SizedBox()
            : WelcomeSliderWidget(
                items: controller.items!,
                carouselController: controller.carouselController,
                onPageChanged: (index) {
                  controller.onPageChanged(index);
                },
              );
      },
    );
  }

  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: 'bar',
      init: controller,
      builder: (controller) {
        if (controller.isShowStart) {
          return ButtonWidget.primary(
            LocaleKeys.welcomeStart.tr,
            onTab: controller.onToMain,
          );
        }
        return <Widget>[
          ButtonWidget.text(
            LocaleKeys.welcomeSkip.tr,
            onTab: controller.onToMain,
          ),
          SliderIndicatorWidget(
            length: 3,
            currentIndex: controller.currentIndex,
          ),
          ButtonWidget.text(
            LocaleKeys.welcomeNext.tr,
            onTab: controller.onNext,
          ),
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
      },
    );
  }

  Widget _buildView() {
    return <Widget>[
      _builderSlider(),
      _buildBar(),
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      id: "welcome",
      init: WelcomeController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
