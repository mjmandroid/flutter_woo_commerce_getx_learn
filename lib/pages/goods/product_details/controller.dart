import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  // 商品 id , 获取路由传递参数
  int? productId = Get.arguments['id'] ?? 0;

  ProductModel? product;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 当前位置
  int bannerCurrentIndex = 0;

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void _initData() async {
    await _loadProduct();
    update(["product_details"]);
  }

  Future<void> _loadProduct() async {
    // 商品详情
    product = await ProductApi.productDetail(productId);
    if (product?.images != null) {
      bannerItems = product!.images!
          .map((e) => KeyValueModel(
                key: "${e.id}",
                value: e.src ?? "",
              ))
          .toList();
    }
  }

  // Banner 切换事件
  void onChangeBanner(int index, _reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新 Banner
  }
}
