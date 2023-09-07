import 'package:flutter/material.dart';
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

  Widget _buildView() {
    return <Widget>[
      //顶部bar
      _buildTopBar(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page);
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
