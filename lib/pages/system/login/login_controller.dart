import 'package:get/get.dart';

import 'login_state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

  void onTab(int index) {
    Get.snackbar("标题", "消息");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
