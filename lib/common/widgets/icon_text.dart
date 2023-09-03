import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class IconTextWidget extends StatelessWidget {
  final Widget? icon;

  final String? text;

  final IconData? iconData;

  // 图标尺寸
  final double? iconSize;

  // 文字尺寸
  final double? fontSize;

  // 颜色
  final Color? color;

  // 间距
  final double? iconPadding;

  const IconTextWidget({
    Key? key,
    this.icon,
    this.iconData,
    this.text,
    this.iconSize,
    this.color,
    this.fontSize,
    this.iconPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      icon?.paddingRight(iconPadding ?? AppSpace.iconTextSmail) ??
          Icon(
            iconData ?? Icons.start,
            size: iconSize ?? 12,
            color: color ?? AppColors.primary,
          ).paddingRight(iconPadding ?? AppSpace.iconTextSmail),
      TextWidget.body2(
        text ?? '',
        size: fontSize ?? 12,
      ),
    ].toRow(mainAxisSize: MainAxisSize.min).fittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.hardEdge,
        );
  }
}
