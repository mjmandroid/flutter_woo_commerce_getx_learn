import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/line_item.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

class BuildProductList extends StatelessWidget {
  final List<LineItem> lineItems;

  /// 货币符号
  final String? currencySymbol;

  const BuildProductList({
    Key? key,
    required this.lineItems,
    this.currencySymbol,
  }) : super(key: key);

  //标题
  TableRow _tableHeader() {
    return TableRow(children: [
      const SizedBox(width: 50),
      TextWidget.body1(LocaleKeys.orderDetailsProduct.tr),
      TextWidget.body1(LocaleKeys.orderDetailsRateQty.tr),
      TextWidget.body1(LocaleKeys.orderDetailsAmount.tr)
    ]);
  }

  Widget _buildView() {
    List<TableRow> ws = [];

    // 头部
    ws.add(_tableHeader());
    for (var i = 0; i < lineItems.length; i++) {
      LineItem item = lineItems[i];
      TableRow tr = TableRow(children: [
        // 编号
        TextWidget.body2("${i + 1}").alignCenter(),
        <Widget>[
          ImageWidget.url(
            Convert.aliImageResize(item.product?.images?[0].src ?? "",
                width: 140),
            width: 70.w,
            height: 70.w,
            radius: AppRadius.image,
          ),
          TextWidget.body2(item.product?.name ?? ""),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        // 单价x数量
        TextWidget.body2(
          "${item.price} x ${item.quantity}",
        ),

        // 金额
        TextWidget.body2("$currencySymbol ${item.total}"),
      ]);
      ws.add(tr);
    }
    return Table(
      children: ws,
      columnWidths: const {
        0: FixedColumnWidth(50),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(80),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
