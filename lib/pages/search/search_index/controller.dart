import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:get/get.dart';

class SearchIndexController extends GetxController {
  final TextEditingController searchEditController = TextEditingController();

  final searchKeyword = "".obs;

  // Tags 列表
  List<TagModel> tagsList = [];

  @override
  void onReady() {
    super.onReady();
    // 注册防抖
    searchDebounce();
  }

  void searchDebounce() {
    //防抖
    debounce(
      searchKeyword,
      (value) async {
        if (kDebugMode) {
          print("debounce -> " + value.toString());
        }
        await _loadSearch(value);
        update(['search_index']);
      },
      time: const Duration(milliseconds: 500),
    );
    searchEditController.addListener(() {
      searchKeyword.value = searchEditController.text;
    });
  }

  // 列表项点击事件
  void onListItemTap(TagModel tagModel) {
    Get.toNamed(
      RouteNames.searchFilter,
      arguments: {"tagId": tagModel.id},
    );
  }

  Future<bool> _loadSearch(String keyword) async {
    if (keyword.trim().isEmpty == true) {
      tagsList.clear();
      return false;
    }
    var res = await ProductApi.tags(TagsReq(
      search: keyword,
    ));
    tagsList.clear();
    if (res.isNotEmpty) {
      tagsList.addAll(res);
    }
    return true;
  }

  @override
  void onClose() {
    super.onClose();
    searchEditController.dispose();
  }
}
