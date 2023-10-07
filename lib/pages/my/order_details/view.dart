import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/appbar.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/my/order_details/index.dart';
import 'package:get/get.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  const OrderDetailPage({Key? key}) : super(key: key);
  // 标题
  Widget _buildTitle() {
    return <Widget>[
      // Order ID
      TextWidget.title3(
              "${LocaleKeys.orderDetailsOrderID.tr} : ${controller.order.id}")
          .expanded(),

      // 15 Jan 2019
      TextWidget.body2("${controller.order.dateCreated?.dateFormatOfyyyyMMdd}"),
    ].toRow().padding(
          top: AppSpace.page,
          bottom: AppSpace.listRow,
          left: AppSpace.page,
          right: AppSpace.page,
        );
  }

  // 横向状态
  Widget _buildHorizontalStatus() {
    return const Text("横向状态");
  }

  // 纵向状态
  Widget _buildVerticalStatus() {
    return const Text("纵向状态");
  }

  // 寄件地、目的地
  Widget _buildBillAddress() {
    return const Text("寄件地、目的地");
  }

  // 商品列表
  Widget _buildProductsList() {
    return const Text("商品列表");
  }

  // 小计
  Widget _buildTotal() {
    return const Text("小计");
  }

  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 标题
        _buildTitle(),

        // 横向状态
        _buildHorizontalStatus(),

        // 纵向状态
        _buildVerticalStatus(),

        // 寄件地、目的地
        _buildBillAddress(),

        // 商品列表
        _buildProductsList(),

        // 小计
        _buildTotal(),

        // 底部间距
        const SizedBox(height: 100),
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      id: 'order_details',
      init: OrderDetailController(),
      builder: (_) {
        return Scaffold(
          appBar:
              mainAppBarWidget(titleString: LocaleKeys.orderDetailsTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
