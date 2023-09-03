import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/attribute_model/attribute_model.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class TagsListWidget extends StatelessWidget {
  final Function(List<String> keys)? onTap;

  //颜色
  final List<KeyValueModel<AttributeModel>> itemList;
  final List<String> keys;

  final double? width;
  final double? height;
  final Color? textColor;
  final Color? textSelectColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? bgColor;
  final Color? bgSelectColor;
  final double? borderRadius;
  final double? spacing;
  final double? runSpacing;
  final bool? isCircle;
  final double? size;

  TagsListWidget({
    Key? key,
    this.onTap,
    required this.itemList,
    required this.keys,
    this.width = 50,
    this.height = 30,
    Color? textColor,
    Color? textSelectColor,
    this.textSize,
    this.fontWeight,
    Color? bgColor,
    Color? bgSelectColor,
    this.borderRadius,
    this.spacing,
    this.runSpacing,
    this.isCircle = false,
    this.size,
  })  : bgColor = bgColor ?? AppColors.surfaceVariant,
        bgSelectColor = bgSelectColor ?? AppColors.primary,
        textColor = textColor ?? AppColors.secondary,
        textSelectColor = textSelectColor ?? AppColors.onPrimary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final elements = List.generate(
      itemList.length,
      (index) => SizedBox(
        width: size ?? width,
        height: size ?? height,
        child: TextWidget.body2(
          itemList[index].value.name ?? "",
          color:
              keys.hasValue(itemList[index].key) ? textSelectColor : textColor,
          size: textSize,
          weight: fontWeight ?? FontWeight.bold,
        )
            .center()
            .decorated(
              color:
                  keys.hasValue(itemList[index].key) ? bgSelectColor : bgColor,
              borderRadius: BorderRadius.circular(
                  isCircle == true ? size ?? 24 : borderRadius ?? 3),
            )
            .onTap(() {
          if (keys.hasValue(itemList[index].key)) {
            keys.remove(itemList[index].key);
          } else {
            keys.add(itemList[index].key);
          }
          onTap?.call(keys);
        }),
      ),
    );
    return elements.toWrap(
      spacing: spacing ?? AppSpace.listRow,
      runSpacing: runSpacing ?? AppSpace.listItem,
    );
  }
}
