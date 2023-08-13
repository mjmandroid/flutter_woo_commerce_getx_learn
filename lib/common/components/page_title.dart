import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  final String desc;

  const PageTitleWidget({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.title1(title),
      TextWidget.body2(desc),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(left: 10, top: 10, bottom: 10);
  }
}
