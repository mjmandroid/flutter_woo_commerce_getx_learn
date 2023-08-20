import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
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
}
