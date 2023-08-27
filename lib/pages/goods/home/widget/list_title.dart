import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

class BuildListTitle extends StatelessWidget {
  final String title;

  /// 次标题
  final String? subTitle;
  final Function()? onTap;

  const BuildListTitle({
    Key? key,
    required this.title,
    this.subTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.title1(
        title,
      ),
      TextWidget.body2(
        subTitle ?? "",
        color: AppColors.primary,
      ).paddingLeft(AppSpace.listItem).expanded(),
      <Widget>[
        TextWidget.body1(
          LocaleKeys.gHomeMore.tr,
        ),
        const IconWidget.icon(Icons.chevron_right),
      ].toRow(mainAxisSize: MainAxisSize.min).onTap(onTap)
    ].toRow();
  }
}
