import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class StarsListWidget extends StatelessWidget {
  final Function(int)? onTap;

  final IconData? iconData;

  /// 星级数量
  final int starNum;

  /// 选中的星级
  final int value;

  /// 星级大小
  final double? size;

  // 颜色
  final Color? color;

  // 选中颜色
  final Color? selectedColor;

  // 元素间距
  final double? spacing;

  // 行间距
  final double? runSpacing;

  StarsListWidget({
    Key? key,
    this.onTap,
    this.iconData,
    this.size,
    Color? color,
    Color? selectedColor,
    this.spacing = 5,
    this.runSpacing = 5,
    this.starNum = 5,
    this.value = 0,
  })  : color = color ?? AppColors.surfaceVariant,
        selectedColor = selectedColor ?? AppColors.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      for (var i = 1; i <= starNum; i++)
        IconWidget.icon(
          iconData ?? Icons.star,
          size: size ?? 12,
          color: i <= value ? selectedColor : color,
        ).onTap(() {
          if (value == 1 && i == value) {
            onTap?.call(0);
          } else {
            onTap?.call(i);
          }
        }),
    ].toWrap(
      spacing: spacing ?? AppSpace.listItem,
      runSpacing: runSpacing ?? AppSpace.listRow,
    );
  }
}
