import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

class ListTileWidget extends StatelessWidget {
  //标题
  final Widget? title;
  final Widget? subTitle;

  //描述
  final Widget? description;

  ///左侧图标
  final Widget? leading;

  /// 左侧图标间距
  final double? leadingSpace;

  /// 右侧图标
  final List<Widget>? trailing;

  final EdgeInsetsGeometry? padding;

  /// cross 对齐方式
  final CrossAxisAlignment? crossAxisAlignment;

  /// 点击事件
  final GestureTapCallback? onTap;

  /// 长按事件
  final GestureLongPressCallback? onLongPress;

  ListTileWidget({
    Key? key,
    this.title,
    this.subTitle,
    this.description,
    this.leading,
    this.leadingSpace,
    this.trailing,
    EdgeInsetsGeometry? padding,
    this.crossAxisAlignment,
    this.onTap,
    this.onLongPress,
  })  : padding = padding ?? AppSpace.edgeInput,
        super(key: key);

  Widget _buildView() {
    List<Widget> ws = [];
    // 头部图标
    if (leading != null) {
      ws.add(
        leading!.paddingRight(
          leadingSpace ?? AppSpace.iconTextSmail,
        ),
      );
    }
    // 标题/子标题/描述
    List<Widget> titles = [
      if (title != null) title!,
      if (subTitle != null) subTitle!,
      if (description != null) description!,
    ];
    MainAxisAlignment titleMainAxisAlignment = titles.length == 1
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween;
    ws.add(
      titles
          .toColumn(
            mainAxisAlignment: titleMainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    );
    if (trailing != null) {
      MainAxisAlignment trailingMainAxisAlignement = trailing!.length == 1
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween;
      ws.add(trailing!.toColumn(
        mainAxisAlignment: trailingMainAxisAlignement,
      ));
    }
    return ws
        .toRow(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        )
        .backgroundColor(Colors.transparent)
        .padding(value: padding)
        .onTap(onTap)
        .onLongPress(onLongPress);
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
