import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/category/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  Widget _buildLeftNav() {
    return GetBuilder<CategoryController>(
      id: "left_nav", // 唯一标识
      builder: (_) {
        return ListView.separated(
          itemBuilder: (_, index) {
            return CategoryListItemWidget(
              category: controller.categoryItems[index],
              selectId: controller.categoryId,
              onTap: controller.onCategoryTap,
            );
          },
          separatorBuilder: (_, index) {
            return SizedBox(height: AppSpace.listRow.w);
          },
          itemCount: controller.categoryItems.length,
        )
            .width(100.w)
            .decorated(
              color: AppColors.surfaceVariant,
            )
            .clipRRect(
              topRight: AppRadius.card.w,
              bottomRight: AppRadius.card.w,
            );
      },
    );
  }

  Widget _buildContentView() {
    return GetBuilder<CategoryController>(
      id: "product_list",
      builder: (_) {
        return SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          footer: const SmartRefresherFooterWidget(),
          child: controller.items.isEmpty
              ? const PlaceholdWidget()
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppSpace.listRow,
                    crossAxisSpacing: AppSpace.listItem,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    var product = controller.items[index]; // 商品项数据
                    return ProductItemWidget(
                      product: product,
                      imgHeight: 117.w,
                    );
                  },
                  itemCount: controller.items.length,
                ).paddingHorizontal(AppSpace.listView),
        );
      },
    );
  }

  Widget _buildView() {
    return <Widget>[
      // 左侧导航
      _buildLeftNav(),
      // 右侧商品列表
      _buildContentView().expanded(),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      id: 'category',
      init: CategoryController(),
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.gCategoryTitle.tr,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
