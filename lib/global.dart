import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:get/get.dart';

import 'common/services/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      Store().init(),
      Get.putAsync(() async => ConfigService().init()),
    ]).whenComplete(() => {});

    Loading();
  }
}
