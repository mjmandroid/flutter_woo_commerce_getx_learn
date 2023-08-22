import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/slider_indicator.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class CarouselWidget extends StatelessWidget {
  /// 切换页码
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  /// 点击
  final Function(int, KeyValueModel)? onTap;

  ///数据列表
  final List<KeyValueModel> items;

  final int? currentIndex;

  final double? height;

  /// 指示器 颜色
  final Color? indicatorColor;

  /// 指示器 是否圆形
  final bool? indicatorCircle;

  /// 指示器 对齐方式
  final MainAxisAlignment? indicatorAlignment;

  /// 指示器 位置
  final double? indicatorLeft, indicatorRight, indicatorBottom;

  const CarouselWidget({
    Key? key,
    required this.items,
    this.onPageChanged,
    this.onTap,
    this.currentIndex,
    this.indicatorColor,
    this.indicatorCircle,
    this.height,
    this.indicatorAlignment,
    this.indicatorBottom,
    this.indicatorLeft,
    this.indicatorRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ws = [
      CarouselSlider(
        items: <Widget>[
          for (var i = 0; i < items.length; i++)
            ImageWidget.url(
              items[i].value,
              fit: BoxFit.fill,
            ).onTap(() {
              if (onTap != null) {
                onTap!(i, items[i]);
              }
            }),
        ],
        options: CarouselOptions(
          height: height,
          viewportFraction: 1,
          aspectRatio: 3.2 / 1,
          // 确定当前页面是否应该大于侧面图像， 在旋转木马中营造一种深度感。
          enlargeCenterPage: false,
          autoPlay: true,
          onPageChanged: onPageChanged,
        ),
      ),
      SliderIndicatorWidget(
        length: items.length,
        currentIndex: currentIndex ?? 0,
        color: indicatorColor,
        isCircle: indicatorCircle ?? true,
        alignment: indicatorAlignment ?? MainAxisAlignment.center,
      ).positioned(
        left: indicatorLeft ?? 20,
        right: indicatorRight ?? 20,
        bottom: indicatorBottom ?? 10,
      ),
    ];

    return ws.toStack();
  }
}
