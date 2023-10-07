import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class BuildPriceLine extends StatelessWidget {
  /// 标题 字符串
  final String? titleString;

  /// 价格 字符串
  final String? priceString;

  /// 左侧组件
  final Widget? leftWidget;

  /// 右侧组件
  final Widget? rightWidget;

  const BuildPriceLine({
    Key? key,
    this.titleString,
    this.priceString,
    this.leftWidget,
    this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      leftWidget?.expanded() ?? TextWidget.body2(titleString ?? "").expanded(),
      rightWidget ?? TextWidget.body2(priceString ?? ""),
    ].toRow().paddingBottom(AppSpace.listRow);
  }
}
