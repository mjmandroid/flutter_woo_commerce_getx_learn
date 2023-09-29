import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/cart/buy_now/controller.dart';
import 'package:get/get.dart';

class BuyNowPage extends GetView<BuyNowController> {
  // 商品数据
  final ProductModel product;

  const BuyNowPage({Key? key, required this.product}) : super(key: key);

  // 标题
  Widget _buildTitle(String text) {
    return TextWidget.title2(text).paddingBottom(AppSpace.listRow);
  }

  Widget _buildPayment() {
    return List<Widget>.generate(
            controller.paymentList.length,
            (index) => ImageWidget.asset(
                  controller.paymentList[index],
                  width: 106.w,
                  height: 50.w,
                  backgroundColor: AppColors.surface,
                )
                    .decorated(
                      border: Border.all(
                        color: AppColors.surfaceVariant,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    )
                    .paddingRight(
                      AppSpace.iconTextSmail,
                    ))
        .toListView(scrollDirection: Axis.horizontal)
        .height(50.w)
        .paddingBottom(AppSpace.listRow);
  }

  Widget _buildButtons() {
    return <Widget>[
      ButtonWidget.secondary(
        LocaleKeys.commonBottomCancel.tr,
        onTab: () => Get.back(),
      ).expanded(),
      // 间距
      SizedBox(width: AppSpace.iconTextLarge),
      ButtonWidget.primary(
        LocaleKeys.placeOrderBtnPlaceOrder.tr,
        onTab: controller.onCheckout,
      ).expanded(),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget _buildView() {
    return <Widget>[
      // 支付方式
      _buildTitle(LocaleKeys.placeOrderPayment.tr),
      _buildPayment(),

      // 送货地址
      _buildTitle(LocaleKeys.placeOrderShippingAddress.tr),

      // 数量
      _buildTitle(LocaleKeys.placeOrderQuantity.tr),

      // 小计
      _buildTitle(LocaleKeys.placeOrderPrice.tr),

      // 按钮
      _buildButtons(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: 'buy_now',
      init: BuyNowController(product),
      builder: (_) {
        return _buildView();
      },
    );
  }
}
