import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: AppSpace.listItem,
      title: InputWidget.textBorder(
        controller: controller.searchEditController,
        hintText: 'You can try T-Shirt',
        onChanged: (val) {},
      ).paddingRight(AppSpace.page),
    );
  }

  Widget _buildView() {
    return ListView.separated(
      itemBuilder: (_, index) {
        return _buildListItem(controller.tagsList[index]);
      },
      separatorBuilder: (_, index) {
        return const Divider();
      },
      itemCount: controller.tagsList.length,
    );
  }

  Widget _buildListItem(TagModel tagModel) {
    return ListTile(
      title: TextWidget.body1(tagModel.name ?? ""),
      trailing: IconWidget.icon(
        Icons.north_east,
        color: AppColors.primary,
      ),
      onTap: () => controller.onListItemTap(tagModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchIndexController>(
      id: 'search_index',
      init: SearchIndexController(),
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
