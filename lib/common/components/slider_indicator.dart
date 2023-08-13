import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

class SliderIndicatorWidget extends StatelessWidget {
  ///个数
  final int length;

  ///当前位置
  final int currentIndex;

  /// 颜色
  final Color color;

  ///是否圆形
  final bool isCircle;

  /// 对齐方式
  final MainAxisAlignment alignment;

  SliderIndicatorWidget({
    Key? key,
    required this.length,
    required this.currentIndex,
    Color? color,
    this.isCircle = false,
    this.alignment = MainAxisAlignment.center,
  })  : color = color ?? AppColors.secondary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: !isCircle ? 4 : 6,
          width: !isCircle ? (currentIndex == index ? 15.0 : 8) : 6,
          decoration: BoxDecoration(
            color: currentIndex == index ? color : color.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        );
      }),
    );
  }
}
