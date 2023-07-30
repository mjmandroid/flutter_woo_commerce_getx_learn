import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/routers/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RouterPages.list,
      initialRoute: RouteNames.main,
      navigatorObservers: [RouterPages.observer],
    );
  }
}
