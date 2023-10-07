import 'dart:convert';

import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String token = "";
  final _profile = UserProfileModel().obs;

  bool get isLogin => _isLogin.value;
  UserProfileModel get profile => _profile.value;

  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = Store().getString(Constants.storageToken);

    final profileData = Store().getString(Constants.storageProfile);
    if (profileData.isNotEmpty) {
      _profile.value = UserProfileModel.fromJson(jsonDecode(profileData));
    }
  }

  /// 设置令牌
  Future<void> setToken(String value) async {
    await Store().setString(Constants.storageToken, value);
    token = value;
  }

  /// 获取用户 profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    final result = await UserApi.profile();
    print(result.toJson());
    _profile(result);
    _isLogin.value = true;
    Store().setString(Constants.storageProfile, jsonEncode(result));
  }

  Future<void> setProfile(UserProfileModel model) async {
    if (token.isEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    Store().setString(Constants.storageProfile, jsonEncode(model));
  }

  /// 注销
  Future<void> logout() async {
    // if (_isLogin.value) await UserAPIs.logout();
    await Store().remove(Constants.storageToken);
    _profile(UserProfileModel());
    _isLogin.value = false;
    token = '';
  }

  /// 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.login);
      return false;
    }
    return true;
  }

  /// 送货地址
  String get shipping =>
      "${profile.shipping?.address1}, ${profile.shipping?.postcode}, ${profile.shipping?.state}, ${profile.shipping?.country}";
}
