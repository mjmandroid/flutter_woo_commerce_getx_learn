import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  Widget _buildView() {
    // return controller.productList.isEmpty
    //     ? const PlaceholdWidget()
    //     : GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           childAspectRatio: 0.8,
    //           mainAxisSpacing: AppSpace.listRow,
    //           crossAxisSpacing: AppSpace.listItem,
    //         ),
    //         itemBuilder: (_, index) {
    //           return ProductItemWidget(
    //             product: controller.productList[index],
    //             imgHeight: 170.w,
    //           );
    //         },
    //         itemCount: controller.productList.length,
    //       ).paddingAll(AppSpace.page);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        mainAxisSpacing: AppSpace.listRow,
        crossAxisSpacing: AppSpace.listItem,
      ),
      itemBuilder: (_, index) {
        return ProductItemWidget(
          product: controller.productList[index],
          imgHeight: 170.w,
        );
      },
      itemCount: controller.productList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      id: 'data',
      init: ProductListController(),
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: controller.featured
                ? LocaleKeys.gFlashSellTitle.tr
                : LocaleKeys.gNewsTitle.tr,
          ),
          body: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            enablePullUp: true,
            footer: const SmartRefresherFooterWidget(),
            child: _buildView(),
          ).paddingHorizontal(AppSpace.page),
        );
      },
    );
  }
}
