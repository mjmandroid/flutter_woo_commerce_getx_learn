import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/cart/cart_index/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/home/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/msg/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/my/my_index/index.dart';
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
    DateTime? lastTime;
    return WillPopScope(
      onWillPop: () async {
        if (lastTime == null ||
            DateTime.now().difference(lastTime!) > const Duration(seconds: 2)) {
          lastTime = DateTime.now();
          Loading.toast("Press again to exit");
          return false;
        }
        await SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: GetBuilder<MainController>(
          id: "navigation",
          builder: (_) {
            return BuildNavigation(
              currentIndex: controller.currentIndex,
              items: [
                NavigationItemModel(
                  label: LocaleKeys.tabBarHome.tr,
                  icon: AssetsSvgs.navHomeSvg,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarCart.tr,
                  icon: AssetsSvgs.navCartSvg,
                  count: 3,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarMessage.tr,
                  icon: AssetsSvgs.navMessageSvg,
                  count: 9,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarProfile.tr,
                  icon: AssetsSvgs.navProfileSvg,
                ),
              ],
              onTap: controller.onJumpToPage,
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            HomePage(),
            CartIndexPage(),
            MsgIndexPage(),
            MyIndexPage(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      // init: Get.find<MainController>(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('main')),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
