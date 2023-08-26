import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/image.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class CategoryListItemWidget extends StatelessWidget {
  final CategoryModel category;
  final int? selectId;

  /// tap 事件
  final Function(int categoryId)? onTap;

  const CategoryListItemWidget({
    Key? key,
    required this.category,
    this.selectId,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      ImageWidget.url(
        category.image?.src ?? "",
        width: 52.w,
        height: 52.w,
      ),
      TextWidget.body1(
        category.name ?? "-",
        size: 18.sp,
        color: selectId == category.id ? AppColors.onSecondary : null,
      )
    ]
        .toColumn(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )
        .paddingVertical(AppSpace.button)
        .backgroundColor(
          selectId == category.id
              ? AppColors.onSurfaceVariant
              : Colors.transparent,
        )
        .onTap(() => onTap?.call(category.id!));
  }
}
