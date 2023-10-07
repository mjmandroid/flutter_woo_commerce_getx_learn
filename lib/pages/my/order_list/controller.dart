import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderListController extends GetxController {
  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );
  // 列表
  List<OrderModel> items = [];
  // 页码
  int _page = 1;
  // 页尺寸
  final int _limit = 20;

  Future<bool> _loadSearch(bool isRefresh) async {
    var result = await OrderApi.orders(OrdersReq(
      page: isRefresh ? 1 : _page,
      prePage: _limit,
    ));
    // 下拉刷新
    if (isRefresh) {
      _page = 1; // 重置页数1
      items.clear(); // 清空数据
    }

    // 有数据
    if (result.isNotEmpty) {
      // 页数+1
      _page++;

      // 添加数据
      items.addAll(result);
    }

    // 是否空
    return result.isEmpty;
  }

  void onLoading() async {
    if (items.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadSearch(false);

        if (isEmpty) {
          // 设置无数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (e) {
        // 加载失败
        refreshController.loadFailed();
      }
    } else {
      refreshController.loadNoData();
    }
    update(["order_list"]);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      await _loadSearch(true);
      refreshController.refreshCompleted();
    } catch (error) {
      // 刷新失败
      refreshController.refreshFailed();
    }
    update(["order_list"]);
  }

  // 订单详情
  void onOrderItemTap(OrderModel order) {
    Get.toNamed(RouteNames.orderDetail, arguments: order);
  }

  @override
  void onClose() {
    super.onClose();
    // 刷新控制器释放
    refreshController.dispose();
  }
}
