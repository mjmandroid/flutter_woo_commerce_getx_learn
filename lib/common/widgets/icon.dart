import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

enum IconWidgetType { icon, svg, image, url }

class IconWidget extends StatelessWidget {
  final IconWidgetType type;

  final IconData? iconData;

  final String? assetName;

  final String? imageUrl;

  final double? size;

  final double? width;

  final double? height;

  final Color? color;

  /// 是否小圆点
  final bool? isDot;

  /// Badge 文字
  final String? badgeString;

  final BoxFit? fit;

  const IconWidget(
      {Key? key,
      this.type = IconWidgetType.icon,
      this.size,
      this.width,
      this.height,
      this.color,
      this.iconData,
      this.isDot,
      this.imageUrl,
      this.assetName,
      this.badgeString,
      this.fit})
      : super(key: key);

  const IconWidget.icon(
    this.iconData, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  })  : type = IconWidgetType.icon,
        super(key: key);

  const IconWidget.image(
    this.assetName, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  })  : type = IconWidgetType.image,
        super(key: key);

  const IconWidget.svg(this.assetName,
      {Key? key,
      this.size = 24,
      this.width,
      this.height,
      this.color,
      this.iconData,
      this.isDot,
      this.badgeString,
      this.imageUrl,
      this.fit})
      : type = IconWidgetType.svg,
        super(key: key);

  const IconWidget.url(this.imageUrl,
      {Key? key,
      this.size = 24,
      this.width,
      this.height,
      this.color,
      this.iconData,
      this.isDot,
      this.badgeString,
      this.assetName,
      this.fit})
      : type = IconWidgetType.url,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    switch (type) {
      case IconWidgetType.icon:
        icon = Icon(
          iconData,
          size: size,
          color: color ?? AppColors.primary,
        );
        break;
      case IconWidgetType.svg:
        icon = SvgPicture.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.image:
        icon = Image.asset(
          assetName!,
          width: width,
          height: height,
          color: color,
          fit: fit,
        );
        break;
      case IconWidgetType.url:
        icon = Image.network(
          imageUrl!,
          width: width,
          height: height,
          color: color,
          fit: fit,
        );
        break;
      default:
        icon = const SizedBox();
    }
    if (isDot == true) {
      return Badge(
        position: BadgePosition.bottomEnd(bottom: 0, end: -2),
        badgeStyle: BadgeStyle(
          elevation: 0,
          badgeColor: AppColors.primary,
          padding: const EdgeInsets.all(4.0),
        ),
        child: icon,
      );
    }
    if (badgeString?.isNotEmpty == true) {
      return Badge(
        position: BadgePosition.topEnd(top: -7, end: -8),
        badgeContent: Text(
          badgeString!,
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 9,
          ),
        ),
        badgeStyle: BadgeStyle(
          elevation: 0,
          badgeColor: AppColors.primary,
          padding: const EdgeInsets.all(4.0),
        ),
        child: icon,
      );
    }
    return icon;
  }
}
