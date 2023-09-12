import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/search/search_filter/index.dart';
import 'package:get/get.dart';

class FilterView extends GetView<SearchFilterController> {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: 'filter_view',
      builder: (_) {
        return _buildView();
      },
    );
  }

  Widget _buildSizes() {
    return GetBuilder<SearchFilterController>(
      id: "filter_sizes",
      builder: (_) {
        return TagsListWidget(
          onTap: controller.onSizeTap,
          itemList: controller.sizes,
          keys: controller.sizeKeys,
          size: 24,
          isCircle: true,
          bgSelectColor: AppColors.highlight,
          textSelectColor: AppColors.onPrimary,
          textSize: 9,
          fontWeight: FontWeight.w400,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  Widget _buildColors() {
    return GetBuilder<SearchFilterController>(
      id: 'filter_colors',
      builder: (_) {
        return ColorListWidget(
          itemList: controller.colors,
          keys: controller.colorKeys,
          onTap: controller.onColorTap,
          size: 24,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  Widget _buildStars() {
    return GetBuilder<SearchFilterController>(
      id: 'filter_stars',
      builder: (_) {
        return StarsListWidget(
          onTap: controller.onStarTap,
          value: controller.starValue,
          size: 18,
          selectedColor: AppColors.highlight,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  Widget _buildBrands() {
    return GetBuilder<SearchFilterController>(
      id: 'filter_brands',
      builder: (_) {
        return TagsListWidget(
          onTap: controller.onBrandTap,
          itemList: controller.brands,
          keys: controller.brandKeys,
          bgSelectColor: AppColors.highlight,
          textSelectColor: AppColors.onPrimary,
          borderRadius: 11,
          height: 17,
          width: 55,
          textSize: 9,
          fontWeight: FontWeight.w400,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  // 性别选择
  Widget _buildGenders() {
    return GetBuilder<SearchFilterController>(
      id: "filter_genders",
      builder: (_) {
        return TagsListWidget(
          onTap: controller.onGenderTap,
          itemList: controller.genders,
          keys: controller.genderKeys,
          bgSelectColor: AppColors.highlight,
          textSelectColor: AppColors.onPrimary,
          borderRadius: 11,
          height: 17,
          width: 55,
          textSize: 9,
          fontWeight: FontWeight.w400,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  // 新旧选择
  Widget _buildConditions() {
    return GetBuilder<SearchFilterController>(
      id: "filter_conditions",
      builder: (_) {
        return TagsListWidget(
          onTap: controller.onConditionTap,
          itemList: controller.conditions,
          keys: controller.conditionKeys,
          bgSelectColor: AppColors.highlight,
          textSelectColor: AppColors.onPrimary,
          borderRadius: 11,
          height: 17,
          width: 55,
          textSize: 9,
          fontWeight: FontWeight.w400,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  Widget _buildView() {
    return <Widget>[
      //顶部bar
      _buildTopBar(),
      // 价格
      _buildTitle(LocaleKeys.searchFilterPrice.tr),
      _buildPriceRange(),
      // 尺寸
      _buildTitle(LocaleKeys.searchFilterSize.tr),
      _buildSizes(),
      // 颜色
      _buildTitle(LocaleKeys.searchFilterColor.tr),
      _buildColors(),
      // 评价
      _buildTitle(LocaleKeys.searchFilterReview.tr),
      _buildStars(),
      // 品牌
      _buildTitle(LocaleKeys.searchFilterBrand.tr),
      _buildBrands(),

      // 性别
      _buildTitle(LocaleKeys.searchFilterGender.tr),
      _buildGenders(),

      // 新旧
      _buildTitle(LocaleKeys.searchFilterCondition.tr),
      _buildConditions(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page);
  }

  Widget _buildPriceRange() {
    return GetBuilder<SearchFilterController>(
      id: 'filter_price_range',
      builder: (_) {
        return PriceRangeWidget(
          max: 5000,
          min: 0,
          values: controller.priceRange,
          onDragging: controller.onPriceRangeDragging,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  // 标题栏
  Widget _buildTitle(String title) {
    return TextWidget.body2(title).paddingBottom(AppSpace.listRow);
  }

  Widget _buildTopBar() {
    return GetBuilder<SearchFilterController>(
      id: 'filter_view',
      builder: (_) {
        return <Widget>[
          // 文字
          TextWidget.title3(LocaleKeys.searchFilter.tr),
          ButtonWidget.icon(
            IconWidget.icon(
              Icons.close,
              size: 15,
              color: AppColors.secondary,
            ),
            onTab: controller.onFilterCloseTap,
          ),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
            .paddingBottom(AppSpace.listRow);
      },
    );
  }
}
