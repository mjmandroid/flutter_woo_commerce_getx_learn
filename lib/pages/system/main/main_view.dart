import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/icon.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
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
          child: Text(
            "MainPage${ConfigService.to.locale.toLanguageTag()}",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ConfigService.to.onLocaleUpdate(Translation.supportedLocales[0]);
          },
          child: Text("切换英文"),
        ),
        ElevatedButton(
          onPressed: () {
            ConfigService.to.switchThemeModel();
          },
          child: Text("切换主题"),
        ),
        ListTile(
          title: TextWidget.title1("title1"),
        ),
        ListTile(
          title: TextWidget.title2("title2"),
        ),
        ListTile(
          title: TextWidget.title3("title3"),
        ),
        ListTile(
          title: TextWidget.body1("body1"),
        ),
        ListTile(
          title: TextWidget.body2("body2"),
        ),
        IconWidget.svg(AssetsSvgs.cBagSvg),
        ButtonWidget.textRoundFilled(
          "",
          borderRadius: 10,
          width: 20,
          height: 20,
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: InputWidget.search(
            maxLines: null,
          ),
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
          appBar: AppBar(title: Text(ConfigService.to.version)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
