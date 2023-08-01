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

  bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _preferences.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }
}
