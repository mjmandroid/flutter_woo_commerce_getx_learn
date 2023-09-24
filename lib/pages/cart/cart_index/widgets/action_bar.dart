import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

class ActionBar extends StatelessWidget {
  final bool isAll;
  final Function(bool)? onAll;
  final Function()? onRemove;

  const ActionBar({
    Key? key,
    this.onAll,
    this.isAll = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 选择框
      CheckBoxWidget.all(
        isAll,
        onAll,
        size: 24.sp,
        fontColor: AppColors.highlight,
        label: TextWidget.body1(
          LocaleKeys.gCartBtnSelectAll.tr,
        ),
      ).expanded(),

      // 删除按钮
      ButtonWidget.icon(
        IconWidget.icon(
          CupertinoIcons.delete,
          size: 20.sp,
        ),
        onTab: onRemove,
      ),
    ].toRow();
  }
}
