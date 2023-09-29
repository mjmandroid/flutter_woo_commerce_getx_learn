import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/line_item.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/cart/cart_index/index.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final LineItem lineItem;

  final Function(int)? onChangeQuantity;

  final Function(bool)? onSelect;

  /// 是否全选
  final bool isSelected;

  const CartItem({
    Key? key,
    required this.lineItem,
    required this.isSelected,
    this.onChangeQuantity,
    this.onSelect,
  }) : super(key: key);

  Widget _buildView() {
    // 商品
    ProductModel product = lineItem.product!;
    return <Widget>[
      CheckBoxWidget.all(
        isSelected,
        onSelect,
        fontColor: AppColors.primary,
        bgColorChecked: AppColors.primaryContainer,
        size: 20.sp,
      ).paddingRight(AppSpace.iconTextSmail),
      ImageWidget.url(
        Convert.aliImageResize(
          product.images?.first.src ?? "",
          width: 100.w,
        ),
        fit: BoxFit.cover,
        width: 78.w,
        height: 100.w,
        radius: AppRadius.image.w,
      ).paddingRight(AppSpace.iconTextSmail),
      <Widget>[
        // 标题
        TextWidget.title3(lineItem.name ?? "").paddingBottom(AppSpace.listRow),

        // 属性 Color
        if (product.attributes?.isNotEmpty == true)
          TextWidget.body2(
            "${product.attributes?.first.name} - ${product.attributes?.first.options} ",
          ),

        // 属性 Size
        if (product.attributes?.length == 2)
          TextWidget.body2(
            "${product.attributes?[1].name} - ${product.attributes?[1].options} ",
          ),
        // 金额 + 数量
        <Widget>[
          // 金额
          TextWidget.body2(
            "\$ ${lineItem.total}",
            weight: FontWeight.bold,
          ).expanded(),
          QuantityWidget(
            onChange: (quantity) {
              onChangeQuantity?.call(quantity);
            },
            quantity: lineItem.quantity ?? 0,
          ),
          // end
        ].toRow().paddingTop(AppSpace.listRow),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartIndexController>(
        id: "goods_${lineItem.productId}",
        builder: (controller) {
          return _buildView();
        });
  }
}
