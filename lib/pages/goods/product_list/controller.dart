import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductListController extends GetxController {
  List<ProductModel> productList = [];

  final refreshController = RefreshController(
    initialRefresh: true,
  );

  final _featured = Get.arguments['featured'] ?? false;

  bool get featured => _featured;

  int _page = 1;
  final int _limit = 20;

  ///拉取商品数据
  Future<bool> _loadNewSell(bool isRefresh) async {
    var result = await ProductApi.products(ProductsReq(
      page: isRefresh ? 1 : _page,
      prePage: _limit,
      featured: _featured,
    ));
    if (isRefresh) {
      _page = 1;
      productList.clear();
    }
    if (result.isNotEmpty) {
      _page++;
      productList.addAll(result);
      productList.addAll(result);
    }
    return result.isEmpty;
  }

  void onLoading() async {
    try {
      if (productList.isEmpty) {
        refreshController.loadNoData();
      } else {
        final isEmpty = await _loadNewSell(false);
        if (isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      }
    } catch (e) {
      print(e);
      refreshController.refreshFailed();
    }
    update(['data']);
  }

  void onRefresh() async {
    try {
      await _loadNewSell(true);
      refreshController.refreshCompleted();
    } catch (e) {
      print(e);
      refreshController.refreshFailed();
    }
    update(['data']);
  }

  @override
  void onClose() {
    super.onClose();
    // 刷新控制器释放
    refreshController.dispose();
  }
}
