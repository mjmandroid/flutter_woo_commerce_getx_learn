import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/attribute_model/attribute_model.dart';
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

  ///商品详情
  static Future<ProductModel> productDetail(int? id) async {
    var res = await WPHttpService.to.get(
      '/products/$id',
    );
    return ProductModel.fromJson(res.data);
  }

  /// 属性列表
  /// id 1 颜色 2 尺寸
  static Future<List<AttributeModel>> attributes(int id) async {
    var res = await WPHttpService.to.get(
      '/products/attributes/$id/terms',
    );
    print("----attributes" + "-${res.data.length}");
    List<AttributeModel> attributes = [];
    for (var item in res.data) {
      attributes.add(AttributeModel.fromJson(item));
    }
    attributes.sort((a, b) => a.menu_order!.compareTo(b.menu_order!));
    return attributes;
  }

  ///评论
  static Future<List<ReviewModel>> reviews(ReviewsReq? req) async {
    var res = await WPHttpService.to.get(
      '/products/reviews',
      params: req?.toJson(),
    );
    List<ReviewModel> reviews = [];
    for (var item in res.data) {
      reviews.add(ReviewModel.fromJson(item));
    }
    return reviews;
  }
}
