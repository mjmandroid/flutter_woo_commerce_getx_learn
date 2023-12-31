import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/billing.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/shipping.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';

class UserApi {
  ///注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post("/users/register", data: req);
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post("/users/login", data: req);
    return UserTokenModel.fromJson(res.data);
  }

  /// profile
  static Future<UserProfileModel> profile() async {
    final res = await WPHttpService.to.get("/users/me");
    return UserProfileModel.fromJson(res.data);
  }

  /// 保存用户 billing address
  static Future<UserProfileModel> saveBillingAddress(Billing? req) async {
    final res = await WPHttpService.to.put("/users/me", data: {"billing": req});
    return UserProfileModel.fromJson(res.data);
  }

  /// 保存用户 shipping address
  static Future<UserProfileModel> saveShippingAddress(Shipping? req) async {
    var res = await WPHttpService.to.put(
      '/users/me',
      data: {
        "shipping": req,
      },
    );
    return UserProfileModel.fromJson(res.data);
  }

  /// 大陆国家洲省列表
  static Future<List<ContinentsModel>> continents() async {
    var res = await WPHttpService.to.get(
      '/users/continents',
    );

    List<ContinentsModel> continents = [];
    for (var item in res.data) {
      continents.add(ContinentsModel.fromJson(item));
    }
    return continents;
  }
}
