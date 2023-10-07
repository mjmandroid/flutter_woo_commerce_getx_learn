import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/my/order_list/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        OrderModel item = controller.items[index];
        return BuildOrderListItem(item: item)
            .onTap(() => controller.onOrderItemTap(item));
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: AppSpace.listRow * 2),
      itemCount: controller.items.length,
    );
  }

  // 主视图
  Widget _buildView() {
    return _buildList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListController>(
      id: 'order_list',
      init: OrderListController(),
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.orderListTitle.tr),
          body: SafeArea(
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullUp: true,
              onLoading: controller.onLoading,
              onRefresh: controller.onRefresh,
              footer: const SmartRefresherFooterWidget(),
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}
