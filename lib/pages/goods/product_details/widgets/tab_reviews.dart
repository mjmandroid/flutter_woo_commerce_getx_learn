import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/refresher.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/goods/product_details/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabReviewsView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabReviewsView(this.uniqueTag, {Key? key}) : super(key: key);

  Widget _buildListItem(ReviewModel item) {
    return <Widget>[
      //头像
      const ImageWidget.url(
        "https://ducafecat.oss-cn-beijing.aliyuncs.com/avatar/00258VC3ly1gty0r05zh2j60ut0u0tce02.jpg",
        width: 55,
        height: 55,
      ).paddingRight(AppSpace.listItem),
      // 星、名称、评论、图
      <Widget>[
        // 名称
        TextWidget.title3(
          item.reviewer ?? "",
        ),
        // 评论
        <Widget>[
          TextWidget.body1(
            item.review?.clearHtml ?? "",
          ).expanded(),
          TextWidget.body1(
              DateTime.parse(item.dateCreated ?? "").toDateString()),
        ].toRow(),

        // 图
        _buildReviewImages(),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).expanded(),
    ].toRow(crossAxisAlignment: CrossAxisAlignment.start);
  }

  // 评论图
  Widget _buildReviewImages() {
    return <Widget>[
      // 图
      for (var i = 0; i < controller.reviewImages.length; i++)
        ImageWidget.url(
          controller.reviewImages[i],
          width: 45.w,
          height: 45.w,
        ).paddingRight(AppSpace.listItem).onTap(() {
          controller.onReviewsGalleryTap(i);
        }),
    ].toWrap();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_reviews',
      tag: tag,
      builder: (_) {
        return SmartRefresher(
          controller: controller.reviewsRefreshController,
          enablePullUp: true,
          footer: const SmartRefresherFooterWidget(),
          onLoading: controller.onReviewsLoading,
          onRefresh: controller.onReviewsRefresh,
          child: ListView.separated(
            itemBuilder: (_, index) {
              var item = controller.reviews[index];
              return _buildListItem(item);
            },
            separatorBuilder: (_, index) =>
                SizedBox(height: AppSpace.listRow * 2),
            itemCount: controller.reviews.length,
          ),
        );
      },
    );
  }

  @override
  String? get tag => uniqueTag;
}
