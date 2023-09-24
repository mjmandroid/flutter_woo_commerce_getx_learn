import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/line_item.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  static CartService get to => Get.find();

  ///购物车列表
  final RxList<LineItem> lineItems = RxList<LineItem>();

  /// 优惠券列表
  final List<CouponsModel> lineCoupons = [];

  void addCart(LineItem item) {
    int index =
        lineItems.indexWhere((element) => element.productId == item.productId);
    if (index >= 0) {
      item = lineItems.elementAt(index);
      item.quantity = item.quantity! + 1;
      item.price = double.parse(item.product!.price ?? "0");
      item.total = '${item.price! * item.quantity!}';
    } else {
      item.quantity = 1;
      item.price = double.parse(item.product!.price ?? "0");
      item.total = '${item.price! * item.quantity!}';
      lineItems.add(item);
    }
  }

  ///删除商品
  void cancelOrder(int productId) {
    lineItems.removeWhere((element) => element.productId == productId);
  }

  /// 修改商品数量
  void changeQuantity(int productId, int quantity) {
    // 小于等于 0 删除
    if (quantity <= 0) {
      cancelOrder(productId);
      return;
    }

    // 设置商品数量
    LineItem item =
        lineItems.firstWhere((element) => element.productId == productId);
    item.quantity = quantity;
    item.price = double.parse(item.product!.price ?? "0");
    item.total = '${item.price! * item.quantity!}';
  }

  /// 清空购物车
  void clear() {
    lineItems.clear();
  }

  ///商品数量
  int get lineItemCount => lineItems.length;

  /// 运费
  double get shipping => 0;

  /// 使用优惠券
  bool applyCoupon(CouponsModel item) {
    // 是否有重复
    int index = lineCoupons.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      return false;
    }
    // 添加
    lineCoupons.add(item);
    return true;
  }

  /// 折扣
  double get discount =>
      lineCoupons.fold<double>(0, (double previousValue, CouponsModel element) {
        return previousValue + (double.parse(element.amount ?? "0"));
      });

  /// 商品合计价格
  double get totalItemsPrice =>
      lineItems.fold<double>(0, (double previousValue, LineItem element) {
        return previousValue + double.parse(element.total ?? "0");
      });
}
