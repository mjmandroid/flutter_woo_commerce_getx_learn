import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }

  @override
  bool get wantKeepAlive => true;
}

/// getx 组件
class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  Widget _buildView() {
    return Column(
      children: [
        Center(
          child: Text("MainPage${ConfigService.to.locale.toLanguageTag()}"),
        ),
        ElevatedButton(
          onPressed: () {
            ConfigService.to.onLocaleUpdate(Translation.supportedLocales[0]);
          },
          child: Text("切换英文"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
              title: Text(ConfigService.to.version +
                  "${LocaleKeys.commonMessageSuccess.trParams({
                        'method': '哈哈哈'
                      })}")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}