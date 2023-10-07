import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class BuyDonePage extends GetView<BuyDoneController> {
  const BuyDonePage({Key? key}) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      ImageWidget.asset(
        AssetsImages.orderConfirmedPng,
        height: 300.w,
      ),
      // 文字
      TextWidget.title2(LocaleKeys.orderConfirmationTitle.tr)
          .paddingBottom(10.w),
      TextWidget.body1(LocaleKeys.orderConfirmationDesc.tr).paddingBottom(50.w),
      ButtonWidget.primary(
        LocaleKeys.commonBottomBack.tr,
        onTab: () => Get.back(),
      ).tight(width: 160.w, height: 50.w),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
        )
        .center()
        .paddingBottom(40);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BuyDoneController>(
      id: 'buy_done',
      init: BuyDoneController(),
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
