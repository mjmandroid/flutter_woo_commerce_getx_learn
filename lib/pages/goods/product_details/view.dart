import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_details/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with AutomaticKeepAliveClientMixin {
  // 5 定义 tag 值，唯一即可
  final String tag = '${Get.arguments['id'] ?? ''}${UniqueKey()}';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _ProductDetailsGetx(tag);
  }

  @override
  bool get wantKeepAlive => true;
}

class _ProductDetailsGetx extends GetView<ProductDetailsController> {
  // 1 定义唯一 tag 变量
  final String uniqueTag;

  _ProductDetailsGetx(this.uniqueTag, {Key? key}) : super(key: key);

  @override
  String? get tag => uniqueTag;

  // 滚动图
  Widget _buildBanner() {
    return GetBuilder<ProductDetailsController>(
      id: 'product_banner',
      tag: tag,
      builder: (_) {
        return CarouselWidget(
          onTap: controller.onGalleryTap,
          items: controller.bannerItems,
          currentIndex: controller.bannerCurrentIndex,
          onPageChanged: controller.onChangeBanner,
          height: 190.w,
          indicatorCircle: false,
          indicatorAlignment: MainAxisAlignment.start,
          indicatorColor: AppColors.highlight,
        ).backgroundColor(AppColors.surfaceVariant);
      },
    );
  }

  // 商品标题
  Widget _buildTitle() {
    return <Widget>[
      <Widget>[
        // 金额
        TextWidget.title1(
          "\$${controller.product?.price ?? 0}",
        ).expanded(),
        const IconTextWidget(
          iconData: Icons.star,
          text: "4.5",
        ).paddingRight(AppSpace.iconTextMedium),
        // 喜欢
        const IconTextWidget(
          iconData: Icons.favorite,
          text: "100+",
        ),
      ].toRow(),
      // 次标题
      TextWidget.body1(
        controller.product?.shortDescription?.clearHtml ?? "-",
      ),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingAll(AppSpace.page);
  }

  // Tab 栏位按钮
  Widget _buildTabBarItem(String textString, int index) {
    return ButtonWidget.textFilled(
      textString,
      onTab: () => controller.onTabBarTap(index),
      borderRadius: 17,
      textColor: controller.tabIndex == index
          ? AppColors.onPrimary
          : AppColors.secondary,
      bgColor:
          controller.tabIndex == index ? AppColors.primary : Colors.transparent,
    ).tight(width: 100.w, height: 35);
  }

  // Tab 栏位
  Widget _buildTabBar() {
    return GetBuilder<ProductDetailsController>(
      id: 'product_tab',
      tag: tag,
      builder: (_) {
        return <Widget>[
          _buildTabBarItem(LocaleKeys.gDetailTabProduct.tr, 0),
          _buildTabBarItem(LocaleKeys.gDetailTabDetails.tr, 1),
          _buildTabBarItem(LocaleKeys.gDetailTabReviews.tr, 2),
        ].toRow(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  // TabView 视图
  Widget _buildTabView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
        child: TabBarView(
          controller: controller.tabController,
          children: [
            TabProductView(uniqueTag),
            TabDetailView(uniqueTag),
            TabReviewsView(uniqueTag),
          ],
        ),
      ),
    );
  }

  Widget _buildView() {
    return controller.product == null
        ? const PlaceholdWidget()
        : <Widget>[
            // 滚动图
            _buildBanner(),

            // 商品标题
            _buildTitle(),

            // Tab 栏位
            _buildTabBar(),

            // TabView 视图
            _buildTabView(),
          ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: "product_details",
      tag: tag,
      init: ProductDetailsController(),
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: controller.product?.name ?? LocaleKeys.gDetailTitle.tr,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
