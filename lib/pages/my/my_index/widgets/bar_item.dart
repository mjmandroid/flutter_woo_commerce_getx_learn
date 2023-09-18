import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class BarItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const BarItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconWidget.svg(
        svgPath,
        size: 24.sp,
        color: AppColors.primary,
      ),
      // 标题
      TextWidget.body2(
        title,
      ),
    ].toColumn();
  }
}
