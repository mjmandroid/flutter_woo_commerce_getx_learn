import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/cart/buy_now/controller.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/cart/buy_now/index.dart';
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

  Widget _buildShipping() {
    return <Widget>[
      // 文字
      TextWidget.body1(controller.shippingAddress).expanded(),
      const IconWidget.icon(
        Icons.arrow_drop_down,
        size: 32,
      ),
    ]
        .toRow()
        .paddingAll(AppSpace.button)
        .decorated(
          color: AppColors.surfaceVariant,
          border: Border.all(
            width: 0.5,
            color: AppColors.outline,
          ),
          borderRadius: BorderRadius.circular(AppRadius.button),
        )
        .onTap(controller.onShippingTap)
        .paddingBottom(AppSpace.listRow);
  }

  Widget _buildPrice() {
    return <Widget>[
      BuildPriceLine(
        titleString: LocaleKeys.placeOrderPriceShipping.tr,
        priceString: "\$${controller.shipping}",
      ),
      // Discount: $3.05
      BuildPriceLine(
        titleString: LocaleKeys.placeOrderPriceDiscount.tr,
        priceString: "\$${controller.discount}",
      ),
      BuildPriceLine(
        titleString: LocaleKeys.placeOrderPriceVoucherCode.tr,
        rightWidget: ButtonWidget.text(
          LocaleKeys.placeOrderPriceVoucherCodeEnter.tr,
          textSize: 9,
          textColor: AppColors.highlight,
          onTab: controller.onEnterCouponCode,
        ),
      ),
      // Total: $14.60
      BuildPriceLine(
        leftWidget: TextWidget.body1(LocaleKeys.placeOrderTotal.tr),
        rightWidget: TextWidget.body1(
            "\$${controller.totalPrice - controller.discount}"),
      ),
    ].toColumn().paddingBottom(AppSpace.listRow);
  }

  Widget _buildView() {
    return <Widget>[
      // 支付方式
      _buildTitle(LocaleKeys.placeOrderPayment.tr),
      _buildPayment(),

      // 送货地址
      _buildTitle(LocaleKeys.placeOrderShippingAddress.tr),
      _buildShipping(),
      // 数量
      _buildTitle(LocaleKeys.placeOrderQuantity.tr),
      QuantityWidget(
        quantity: controller.quantity,
        onChange: controller.onQuantityChange,
      ).paddingBottom(AppSpace.listRow),
      // 小计
      _buildTitle(LocaleKeys.placeOrderPrice.tr),
      _buildPrice(),
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
