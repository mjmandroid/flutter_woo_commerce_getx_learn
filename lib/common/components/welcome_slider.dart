import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class WelcomeSliderWidget extends StatelessWidget {
  final List<WelcomeModel> items;

  final Function(int) onPageChanged;

  final CarouselController? carouselController;

  const WelcomeSliderWidget({
    Key? key,
    required this.items,
    required this.onPageChanged,
    this.carouselController,
  }) : super(key: key);

  Widget sliderItem(WelcomeModel item) {
    return Builder(builder: (BuildContext context) {
      return <Widget>[
        if (item.image != null)
          ImageWidget.asset(
            item.image!,
            fit: BoxFit.cover,
          ),
        if (item.title != null)
          TextWidget.title1(
            item.title!,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        // 描述
        if (item.desc != null)
          TextWidget.body1(
            item.desc ?? "",
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
      ]
          .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
          .width(MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      items: <Widget>[
        for (var item in items) sliderItem(item),
      ].toList(),
      options: CarouselOptions(
          height: 500.w,
          viewportFraction: 1, //充满
          enlargeCenterPage: false, //
          enableInfiniteScroll: false, //无线循环
          autoPlay: false,
          onPageChanged: (index, reason) => onPageChanged(index)),
    );
  }
}
