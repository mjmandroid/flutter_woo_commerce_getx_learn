import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class BuildTotalItem extends StatelessWidget {
  final String? title;
  final String? price;
  final String? currencySymbol;

  const BuildTotalItem({
    Key? key,
    this.title,
    this.price,
    this.currencySymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // title
      TextWidget.body1(title ?? "").expanded(),
      // price
      TextWidget.body2("$currencySymbol $price"),
    ].toRow();
  }
}
