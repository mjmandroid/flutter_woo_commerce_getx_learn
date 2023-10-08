import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

enum StepStatus {
  none,
  running,
  success,
}

class StepHorizontalItemWidget extends StatelessWidget {
  final String statusName;
  final StepStatus stepStatus;

  const StepHorizontalItemWidget({
    Key? key,
    required this.statusName,
    required this.stepStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraint) {
        return <Widget>[
          <Widget>[
            Container(
              height: 3,
              color: AppColors.surfaceVariant.withOpacity(0.5),
            ),
            if (stepStatus == StepStatus.success)
              Container(
                height: 3,
                color: AppColors.primary,
              ),
            if (stepStatus == StepStatus.running)
              Container(
                height: 3,
                color: AppColors.primary,
                width: boxConstraint.maxWidth / 2,
              ).alignLeft(),
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: stepStatus == StepStatus.none
                    ? AppColors.surfaceVariant.withOpacity(0.5)
                    : AppColors.primary,
                borderRadius: BorderRadius.circular(3.5),
              ),
            )
          ]
              .toStack(alignment: Alignment.center)
              .paddingBottom(AppSpace.iconTextSmail),
          // 文字
          TextWidget.body3(
            statusName,
          ),
        ].toColumn();
      },
    ).expanded();
  }
}

class StepVerticalItemWidget extends StatelessWidget {
  final String statusName;
  final StepStatus stepStatus;

  /// 状态描述
  final String? statusDes;

  /// 状态时间
  final String? statusDateTime;

  const StepVerticalItemWidget({
    Key? key,
    this.stepStatus = StepStatus.none,
    required this.statusName,
    this.statusDateTime,
    this.statusDes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return <Widget>[
          // 日期
          TextWidget.body1(statusDateTime ?? "-"),
          <Widget>[
            // 打底灰色
            Container(
              width: 3,
              height: constraints.minHeight,
              color: AppColors.surfaceVariant.withOpacity(0.5),
            ),
            if (stepStatus == StepStatus.success)
              Container(
                width: 3,
                height: constraints.minHeight,
                color: AppColors.primary,
              ),
            if (stepStatus == StepStatus.running)
              Container(
                width: 3,
                height: constraints.minHeight / 2,
                color: AppColors.primary,
              ).positioned(top: constraints.minHeight / 2),
            // 圆点
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: stepStatus == StepStatus.none
                    ? AppColors.surfaceVariant.withOpacity(0.5)
                    : AppColors.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(7 / 2),
                ),
              ),
            ),
          ].toStack(alignment: Alignment.center).width(30),

          <Widget>[
            TextWidget.title3(statusName),
            TextWidget.body2(
              statusDes ?? "-",
              softWrap: true,
              maxLines: 3,
            ),
          ]
              .toColumn(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .expanded(),
        ].toRow();
      },
    ).constrained(
      minHeight: 70,
    );
  }
}
