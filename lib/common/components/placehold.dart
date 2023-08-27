import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/image.dart';

class PlaceholdWidget extends StatelessWidget {
  final String? assertPath;

  const PlaceholdWidget({
    Key? key,
    this.assertPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWidget.asset(assertPath ?? AssetsImages.homePlaceholderPng)
        .paddingHorizontal(AppSpace.page)
        .center();
  }
}
