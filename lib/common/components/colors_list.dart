import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_string.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/attribute_model/attribute_model.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

class ColorListWidget extends StatelessWidget {
  // 点击事件
  final Function(List<String> keys)? onTap;

  // 颜色列表
  final List<KeyValueModel<AttributeModel>> itemList;

  // 选中的颜色
  final List<String> keys;

  // 单个尺寸
  final double? size;

  // 边框颜色
  final Color? borderSelectedColor;

  // 元素间距
  final double? spacing;

  // 行间距
  final double? runSpacing;

  const ColorListWidget({
    Key? key,
    this.onTap,
    required this.itemList,
    required this.keys,
    this.size,
    this.borderSelectedColor,
    this.spacing,
    this.runSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      for (var item in itemList)
        SizedBox(
          width: size ?? 24,
          height: size ?? 24,
        )
            .decorated(
              color: item.value.slug?.toColor,
              border: keys.hasValue(item.key)
                  ? Border.all(
                      width: 2,
                      color: borderSelectedColor ?? AppColors.highlight,
                    )
                  : null,
              borderRadius: BorderRadius.circular(size ?? 12),
            )
            .tight(width: size, height: size)
            .onTap(() {
          if (keys.hasValue(item.key)) {
            keys.remove(item.key);
          } else {
            keys.add(item.key);
          }
          onTap?.call(keys);
        }),
    ].toWrap(
      spacing: spacing ?? AppSpace.listItem,
      runSpacing: runSpacing ?? AppSpace.listRow,
    );
  }
}
