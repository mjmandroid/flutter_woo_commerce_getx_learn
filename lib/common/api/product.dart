import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/wp_http.dart';

class ProductApi {
  ///分类
  static Future<List<CategoryModel>> categories() async {
    var res = await WPHttpService.to.get(
      '/products/categories',
    );
    List<CategoryModel> categories = [];
    for (var item in res.data) {
      final model = CategoryModel.fromJson(item);
      categories.add(model);
    }
    // 排序 menuOrder , 小号在前
    categories.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return categories;
  }

  /// 商品列表
  static Future<List<ProductModel>> products(ProductsReq? req) async {
    var res = await WPHttpService.to.get(
      '/products',
      params: req?.toJson(),
    );
    List<ProductModel> products = [];
    for (var item in res.data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
