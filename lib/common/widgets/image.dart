import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

enum ImageWidgetType { asset, network, file }

class ImageWidget extends StatelessWidget {
  final String url;

  final ImageWidgetType type;

  final double? radius; // 所有的

  final BorderRadius? borderRadius;

  final double? width;

  final double? height;

  final BoxFit? fit;

  final Widget? placeholder;

  final Color? backgroundColor;

  final Widget Function(
    BuildContext context,
    ImageProvider provider,
    Widget completed,
    Size? size,
  )? builder;

  const ImageWidget({
    Key? key,
    required this.type,
    required this.url,
    this.radius,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  }) : super(key: key);

  const ImageWidget.url(
    this.url, {
    Key? key,
    this.radius,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageWidgetType.network,
        super(key: key);

  const ImageWidget.asset(
    this.url, {
    Key? key,
    this.radius,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageWidgetType.asset,
        super(key: key);

  const ImageWidget.file(
    this.url, {
    Key? key,
    this.radius,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  })  : type = ImageWidgetType.file,
        super(key: key);

  Widget get _placeholder =>
      placeholder ?? const IconWidget.image("assets/images/default.png");

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ??
        BorderRadius.all(
          Radius.circular(radius ?? AppRadius.image),
        );

    Widget? image;
    switch (type) {
      case ImageWidgetType.asset:
        image = ExtendedImage.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
      case ImageWidgetType.network:
        if (!url.contains("http")) break;
        image = ExtendedImage.network(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
      case ImageWidgetType.file:
        image = ExtendedImage.file(
          File(url),
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
        break;
    }

    return image ?? const Placeholder();
  }

  Widget _buildLoadState(BuildContext context, ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return _placeholder;
      case LoadState.completed:
        Size? size;
        if (state.extendedImageInfo != null) {
          size = Size(
            state.extendedImageInfo!.image.width.toDouble(),
            state.extendedImageInfo!.image.height.toDouble(),
          );
        }
        final provider = state.imageProvider;
        final completed = state.completedWidget;
        return builder?.call(context, provider, completed, size) ?? completed;
      case LoadState.failed:
        return const Center(
          child: Icon(
            CupertinoIcons.info_circle,
            size: 20,
            color: Colors.grey,
          ),
        );
    }
  }
}
