import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/search/search_filter/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SearchFilterPage extends GetView<SearchFilterController> {
  const SearchFilterPage({Key? key}) : super(key: key);

  // 搜索过滤栏
  Widget _buildFilterBar() {
    return <Widget>[
      DropdownWidget(
        onChanged: controller.onOrderTap,
        items: controller.orderList,
        hintText: controller.orderSelected.value,
      )
          .decorated(
            border: Border.all(
              width: 1,
              color: AppColors.surfaceVariant,
            ),
          )
          .height(40.h)
          .expanded(),
      // 筛选 Filter
      ButtonWidget.dropdown(
        LocaleKeys.searchFilter.tr,
        IconWidget.icon(
          Icons.expand_more,
          color: AppColors.primary,
        ),
        onTab: controller.onFilterOpenTap,
        textSize: 15,
        textColor: AppColors.secondary,
        textWeight: FontWeight.w400,
        borderColor: AppColors.surfaceVariant,
        height: 40.h,
      ).expanded(),
    ].toRow();
  }

  // 数据列表
  Widget _buildListView() {
    return Text("数据列表");
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 筛选栏
      _buildFilterBar(),
      // 数据列表
      _buildListView(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: 'search_filter',
      init: SearchFilterController(),
      builder: (_) {
        return Scaffold(
          key: controller.scaffoldKey,
          appBar: mainAppBarWidget(
            leading: ButtonWidget.icon(
              IconWidget.icon(
                Icons.arrow_back,
                color: AppColors.primary,
              ),
              onTab: () => Get.back(),
            ),
            // 输入文字
            hintText: LocaleKeys.searchPlaceholder.tr,
            onTap: () => Get.back(),
          ),
          body: _buildView(),
          endDrawer: const Drawer(
            child: SafeArea(
              child: FilterView(),
            ),
          ),
        );
      },
    );
  }
}
