import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class ButtonItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final Color? color;
  final Function()? onTap;

  const ButtonItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? AppColors.primary;
    return ListTileWidget(
      leading: <Widget>[
        Container().tightSize(30.w).decorated(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30.w / 2)),
        IconWidget.svg(
          svgPath,
          color: color,
          size: 14.w,
        ),
      ].toStack(
        alignment: Alignment.center,
      ),
      // 间距
      leadingSpace: 20.w,
      title: TextWidget.body1(
        title,
        size: 15.sp,
        weight: FontWeight.w400,
      ),
      trailing: <Widget>[
        IconWidget.icon(
          Icons.arrow_forward_ios,
          size: 14.w,
          color: AppColors.outline,
        ),
      ],
    ).inkWell(onTap: onTap);
  }
}
