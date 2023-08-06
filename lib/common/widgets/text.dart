import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  final Color? color;

  final double? size;

  final FontWeight? weight;

  final int? maxLines;

  final bool? softWrap;

  final TextOverflow? overflow;

  final TextAlign? textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      this.style,
      this.maxLines = 1,
      this.softWrap = false,
      this.color,
      this.overflow = TextOverflow.clip,
      this.size,
      this.weight,
      this.textAlign})
      : super(key: key);

  const TextWidget.title1(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        super(key: key);

  /// 文字 - 标题2
  const TextWidget.title2(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 标题3
  const TextWidget.title3(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 正文1
  const TextWidget.body1(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        super(key: key);

  /// 文字 - 正文2
  const TextWidget.body2(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        super(key: key);

  /// 文字 - 正文3
  const TextWidget.body3(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w300,
        ),
        super(key: key);

  /// 文字 - 按钮
  TextWidget.button({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    Color? color,
    this.size,
    this.weight,
    this.textAlign,
  })  : color = color ?? AppColors.secondary,
        style = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        super(key: key);

  /// 文字 - 导航
  const TextWidget.navigation({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  })  : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    if (text == "") {
      return const SizedBox();
    }
    return Text(
      text,
      style: style?.copyWith(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ) ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
    );
  }
}
