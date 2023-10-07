import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ApplyPromoCodePage extends GetView<CouponController> {
  // 应用优惠券
  final Function(String) onApplyCouponCode;

  const ApplyPromoCodePage({
    Key? key,
    required this.onApplyCouponCode,
  }) : super(key: key);

  Widget _buildButton() {
    return <Widget>[
      // cancel
      ButtonWidget.text(
        LocaleKeys.commonBottomCancel.tr,
        onTab: () => Get.back(),
      ),
      ButtonWidget.text(
        LocaleKeys.commonBottomApply.tr,
        onTab: () {
          // 回调函数
          onApplyCouponCode(controller.couponController.text);
          Get.back();
        },
        textColor: AppColors.highlight,
        textWidget: FontWeight.w500,
      ),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }

  Widget _buildView() {
    return <Widget>[
      // 标题
      TextWidget.title3(LocaleKeys.promoCode.tr)
          .paddingBottom(AppSpace.listRow),

      // 说明
      TextWidget.body2(
        LocaleKeys.promoDesc.tr,
        maxLines: 3,
        softWrap: true,
      ).paddingBottom(AppSpace.listRow),
      InputWidget.textBorder(
        controller: controller.couponController,
        hintText: "Enter your coupon code",
      ).paddingBottom(AppSpace.listRow),
      _buildButton(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .paddingAll(40)
        .backgroundColor(AppColors.background);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: 'apply_promo_code',
      init: CouponController(),
      builder: (_) {
        return _buildView();
      },
    );
  }
}
