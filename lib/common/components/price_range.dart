import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class PriceRangeWidget extends StatelessWidget {
  final List<double>? values;

  final Function(int, dynamic, dynamic)? onDragging;

  final double? max;
  final double? min;

  const PriceRangeWidget({
    Key? key,
    this.values,
    this.onDragging,
    this.max = 9999,
    this.min = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextWidget.body3("\$${values?[0]}"),
            const Spacer(),
            TextWidget.body3("\$${values?[1]}"),
          ],
        ),
        FlutterSlider(
          values: values!,
          rangeSlider: true,
          max: max,
          min: min,
          handlerHeight: 6,
          handlerWidth: 6,
          onDragging: onDragging,
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: AppColors.highlight,
            ),
            inactiveTrackBar: BoxDecoration(
              color: AppColors.outline,
            ),
          ),
          tooltip: FlutterSliderTooltip(
            leftPrefix: IconWidget.icon(
              Icons.attach_money,
            ),
            rightPrefix: IconWidget.icon(
              Icons.attach_money,
            ),
          ),
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.highlight,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: AppColors.highlight,
                  width: 1,
                ),
              ),
            ),
          ),
          rightHandler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.highlight,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: AppColors.highlight,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
