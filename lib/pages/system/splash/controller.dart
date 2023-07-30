import 'package:get/get.dart';

class SplashController extends GetxController {
  String title = "";

  void _initData() {
    update(['splash']);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _initData();
  }

  void onTab(int ticket) {
    title = "getBuilder -> $ticket 个按钮";
    update(['splash']);
  }
}
