import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/line_item.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';

class OrderApi {
  static Future<OrderModel> crateOrder({
    required List<LineItem> lineItem,
    // 优惠券列表
    required List<CouponsModel> lineCoupons,
  }) async {
    var data = {
      "line_items": lineItem
          .map((e) => {"product_id": e.productId!, "quantity": e.quantity!})
          .toList(),
      // 优惠券
      "coupon_lines": lineCoupons.map((e) => {"code": e.code!}).toList(),
      // 账单地址
      "billing": UserService.to.profile.billing!.toJson(),
      // 送货地址
      "shipping": UserService.to.profile.shipping!.toJson(),
    };
    var res = await WPHttpService.to.post('/orders', data: data);
    return OrderModel.fromJson(res.data);
  }
}
