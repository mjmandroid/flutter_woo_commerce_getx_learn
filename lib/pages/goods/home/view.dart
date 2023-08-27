import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/home/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      title: InputWidget.search(
        // 提示文字，多语言
        hintText: LocaleKeys.gHomeNewProduct.tr,
        readOnly: true,
        onTap: controller.onAppBarTap,
      ),
      actions: [
        const IconWidget.svg(
          AssetsSvgs.pNotificationsSvg,
          size: 20,
          isDot: true,
        )
            .unconstrained() //去掉约束
            .padding(
              left: AppSpace.listItem,
              right: AppSpace.page,
            )
      ],
    );
  }

  // 轮播广告
  Widget _buildBanner() {
    return GetBuilder<HomeController>(
      builder: (_) {
        return CarouselWidget(
          items: controller.bannerItems,
          onPageChanged: controller.onChangeBanner,
          height: 190.w,
          currentIndex: controller.bannerCurrentIndex,
        );
      },
      init: Get.find<HomeController>(),
      id: "home_banner",
    )
        .clipRRect(all: AppSpace.button)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 分类导航
  Widget _buildCategories() {
    return <Widget>[
      for (var i = 0; i < controller.categoryItems.length; i++)
        CategoryListItemWidget(
          category: controller.categoryItems[i],
          onTap: controller.onCategoryTap,
        ).paddingRight(AppSpace.listItem),
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(90.w)
        .paddingVertical(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // Flash Sell
  Widget _buildFlashSell() {
    return <Widget>[
      for (var i = 0; i < controller.flashShellProductList.length; i++)
        ProductItemWidget(
          product: controller.flashShellProductList[i],
          imgHeight: 117.w,
          imgWidth: 120.w,
        )
            .constrained(
              width: 120.w,
              height: 170.w,
            )
            .paddingRight(AppSpace.listItem),
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(170.w)
        .paddingBottom(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // New Sell
  Widget _buildNewSell() {
    return GetBuilder<HomeController>(
      id: 'home_news_sell',
      builder: (_) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ProductItemWidget(
              product: controller.newProductProductList[index],
              imgHeight: 170.w,
            ),
            childCount: controller.newProductProductList.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: AppSpace.listRow,
            crossAxisSpacing: AppSpace.listItem,
          ),
        )
            .sliverPadding(bottom: AppSpace.page)
            .sliverPaddingHorizontal(AppSpace.page);
      },
    );
  }

  Widget _buildView() {
    if (controller.newProductProductList.isEmpty ||
        controller.flashShellProductList.isEmpty) {
      return const PlaceholdWidget();
    }

    return CustomScrollView(
      slivers: [
        // 轮播广告
        _buildBanner(),
        // 分类导航
        _buildCategories(),
        // Flash Sell
        /// 推荐商品 标题
        controller.flashShellProductList.isNotEmpty
            ? BuildListTitle(
                title: LocaleKeys.gHomeFlashSell.tr,
                subTitle: '03. 30. 30',
                onTap: () => controller.onAllTap(true),
              ).sliverToBoxAdapter().sliverPaddingHorizontal(AppSpace.page)
            : const SliverToBoxAdapter(),
        // list
        _buildFlashSell(),

        // new product
        // title
        controller.newProductProductList.isNotEmpty
            ? BuildListTitle(
                title: LocaleKeys.gHomeNewProduct.tr,
                onTap: () => controller.onAllTap(false),
              ).sliverToBoxAdapter().sliverPaddingHorizontal(AppSpace.page)
            : const SliverToBoxAdapter(),

        // list
        _buildNewSell(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "home",
      init: Get.find<HomeController>(),
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            enablePullUp: true,
            footer: const SmartRefresherFooterWidget(),
            child: _buildView(),
          ),
        );
      },
    );
  }
}
