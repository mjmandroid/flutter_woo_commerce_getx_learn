import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class DropdownWidget extends StatelessWidget {
  final Function(KeyValueModel? val)? onChanged;

  final List<KeyValueModel>? items;

  /// 选中数据值
  final KeyValueModel? selectedValue;

  /// 提示文字
  final String? hintText;

  /// 图标颜色
  final Color? iconColor;

  /// 按钮 padding
  final EdgeInsetsGeometry? buttonPadding;

  const DropdownWidget({
    Key? key,
    this.onChanged,
    this.items,
    this.selectedValue,
    this.hintText,
    this.iconColor,
    this.buttonPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        // 提示组件
        hint: Row(
          children: [
            Expanded(
              child: TextWidget.body1(hintText ?? 'Select Item'),
            ),
          ],
        ),
        items: items
            ?.map((e) => DropdownMenuItem<KeyValueModel>(
                  child: TextWidget.body1(e.value),
                  value: e,
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        icon: IconWidget.icon(
          Icons.expand_more,
          color: iconColor ?? AppColors.primary,
        ),
        buttonPadding: buttonPadding ??
            EdgeInsets.symmetric(horizontal: AppSpace.iconTextSmail),
        // 偏移
        offset: const Offset(0, 0),
      ),
    );
  }
}
