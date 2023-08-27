import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Store instance = Store._internal();
  late final SharedPreferences _preferences;
  factory Store() => instance;

  Store._internal();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key) ?? "";
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _preferences.setStringList(key, value);
  }

  Future<bool> setJson(String key, Object value) async {
    return await _preferences.setString(key, jsonEncode(value));
  }

  bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  List<String> getList(String key) {
    return _preferences.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }
}
