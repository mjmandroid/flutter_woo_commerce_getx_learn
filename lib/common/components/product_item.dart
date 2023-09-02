import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

class ProductItemWidget extends StatelessWidget {
  /// 点击事件
  final Function()? onTap;

  ///商品 model
  final ProductModel product;

  /// 图片宽
  final double? imgWidth;

  /// 图片高
  final double? imgHeight;

  const ProductItemWidget({
    Key? key,
    this.onTap,
    required this.product,
    this.imgWidth,
    this.imgHeight,
  }) : super(key: key);

  Widget _buildView(BoxConstraints constraints) {
    print(product.images?.first.src);
    var ws = <Widget>[
      if (product.images?.isNotEmpty == true)
        ImageWidget.url(
          product.images?.first?.src ?? "",
          fit: BoxFit.cover,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.image),
            topRight: Radius.circular(AppRadius.image),
          ),
          width: imgWidth ?? constraints.minWidth,
          height: imgHeight,
        ),
      <Widget>[
        // 标题
        TextWidget.body2(product.name ?? ""),
        if (product.price != null)
          TextWidget.body2(
            product.price ?? "",
            weight: FontWeight.bold,
          ),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(5)
          .expanded(),
    ];
    return ws
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .card(
          blurRadius: 5,
        )
        .padding(all: 5)
        .onTap(() {
      if (onTap != null) {
        onTap?.call();
      } else {
        Get.toNamed(
          RouteNames.goodsProductDetails,
          arguments: {
            "id": product.id,
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return _buildView(constraints);
    });
  }
}
