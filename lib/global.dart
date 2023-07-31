import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/services/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Get.put<ConfigService>(ConfigService());
    await Future.wait([Get.putAsync(() async => ConfigService().init())])
        .whenComplete(() => {});
  }
}
