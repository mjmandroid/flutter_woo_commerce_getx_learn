import 'package:flutter/cupertino.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherFooterWidget extends StatelessWidget {
  final double? height;

  final double? iconSize;

  const SmartRefresherFooterWidget({
    Key? key,
    this.height,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      height: height ?? 60 + MediaQuery.of(context).padding.bottom + 30, // 底部高度
      loadingIcon: const CupertinoActivityIndicator().tight(
        width: iconSize ?? 25,
        height: iconSize ?? 25,
      ),
      outerBuilder: (child) => child.center().height(height ?? 60),
    );
  }
}
