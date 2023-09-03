import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryWidget extends StatelessWidget {
  /// 初始图片位置
  final int initialIndex;

  /// 图片列表
  final List<String> items;

  const GalleryWidget({
    Key? key,
    required this.initialIndex,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        // 全屏, 高度将扩展为包括应用栏的高度
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: PhotoViewGallery.builder(
          // 允许滚动超出边界，但之后内容会反弹回来。
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: items.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(items[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 4,
            );
          },
          loadingBuilder: (_, event) {
            return CircularProgressIndicator(
              backgroundColor: AppColors.highlight,
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                      (event.expectedTotalBytes ?? 1),
            ).tightSize(30).center();
          },
          pageController: PageController(
            initialPage: initialIndex,
          ),
        ),
      ),
    );
  }
}
