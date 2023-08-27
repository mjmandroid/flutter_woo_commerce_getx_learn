import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

AppBar mainAppBarWidget({
  Key? key,
  Function()? onTap,
  Widget? leading,
  String? hintText,
  String? titleString,
  double? titleSpace,
  double? iconSize,
}) {
  return AppBar(
    key: key,
    leading: leading,
    titleSpacing: titleSpace ?? AppSpace.listItem,
    title: hintText != null
        ? InputWidget.textBorder(
            hintText: hintText,
            onTap: onTap,
            readOnly: true,
          )
        : TextWidget(
            text: titleString ?? "",
          ),
    actions: [
      IconWidget.svg(
        AssetsSvgs.iSearchSvg,
        size: iconSize ?? 20,
      ).paddingRight(AppSpace.listItem),
      // 消息
      IconWidget.svg(
        AssetsSvgs.iNotificationsSvg,
        size: iconSize ?? 20,
        isDot: true,
      ).unconstrained().paddingRight(AppSpace.listItem),

      // 更多
      IconWidget.svg(
        AssetsSvgs.iIndicatorsSvg,
        size: iconSize ?? 20,
      ).paddingRight(AppSpace.page),
    ],
  );
}
