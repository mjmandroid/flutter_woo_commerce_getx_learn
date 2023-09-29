import 'package:flutter/cupertino.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class QuantityWidget extends StatelessWidget {
  final Function(int quantity) onChange;

  final int quantity;

  final double? size;
  final double? fontSize;

  // padding 水平距离
  final double? paddingHorizontal;

  // 颜色
  final Color? color;

  QuantityWidget({
    Key? key,
    required this.onChange,
    required this.quantity,
    this.size,
    this.fontSize,
    this.paddingHorizontal,
    Color? color,
  })  : color = color ?? AppColors.onSurfaceVariant,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      ButtonWidget.icon(
        IconWidget.icon(
          CupertinoIcons.minus,
          size: fontSize ?? 14,
          color: color,
        ),
        onTab: () => onChange(quantity - 1 < 0 ? 0 : quantity - 1),
      ),
      TextWidget.body2(
        "$quantity",
        color: color,
      ).center().tightSize(size ?? 24).decorated(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color!, width: 1),
          ),
      ButtonWidget.icon(
        IconWidget.icon(
          CupertinoIcons.plus,
          size: fontSize ?? 14,
          color: color,
        ),
        onTab: () => onChange(quantity + 1),
      ),
    ].toRow();
  }
}
