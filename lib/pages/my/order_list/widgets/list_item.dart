import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

class BuildOrderListItem extends StatelessWidget {
  final OrderModel item;

  const BuildOrderListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget _buildTag(String tag) {
    return ButtonWidget.primary(
      tag,
    ).tight(
      width: 100.w,
      height: 32.w,
    );
  }

  Widget _buildView() {
    return <Widget>[
      // id tag
      <Widget>[
        // 编号
        TextWidget.body1("# ${item.id}").expanded(),

        // 标签tag
        _buildTag(item.status ?? "-"),
      ].toRow().paddingBottom(AppSpace.listRow),
      // orderKey date
      <Widget>[
        // 订单号
        TextWidget.body1("${item.orderKey}").expanded(),

        // 日期
        TextWidget.body2("${item.dateCreated}".dateFormatOfyyyyMMdd),
      ].toRow(),
    ].toColumn().paddingAll(AppSpace.card).card();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
