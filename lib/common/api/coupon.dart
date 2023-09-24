// 优惠券
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';

class CouponApi {
  /// 优惠券详情
  static Future<CouponsModel?> couponDetail(String code) async {
    var res = await WPHttpService.to.get(
      '/coupons',
      params: {
        "code": code,
      },
    );

    List<CouponsModel> coupons = [];
    for (var item in res.data) {
      coupons.add(CouponsModel.fromJson(item));
    }
    return coupons.isNotEmpty ? coupons.first : null;
  }
}
