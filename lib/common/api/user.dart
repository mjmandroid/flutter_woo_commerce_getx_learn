import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';

class UserApi {
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post("/users/register", data: req);
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
