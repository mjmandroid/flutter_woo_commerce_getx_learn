import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

class TextFormWidget extends StatefulWidget {
  final TextEditingController? controller;

  final InputDecoration? decoration;

  final String? Function(String?)? validator;

  final bool? autofocus;

  final String? labelText;

  ///必须输入
  final bool? isMustBeEnter;

  final bool? isObscure;

  /// 是否只读
  final bool? readOnly;

  /// 输入法类型
  final TextInputType? keyboardType;

  /// 输入格式定义
  final List<TextInputFormatter>? inputFormatters;

  /// 提示文字
  final String? hintText;

  /// 点击事件
  final Function()? onTap;

  const TextFormWidget({
    Key? key,
    this.controller,
    this.autofocus = false,
    this.labelText,
    this.isMustBeEnter = false,
    this.validator,
    this.isObscure = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.hintText,
  }) : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  // 是否显示明文按钮
  bool _isShowObscureIcon = false;

  @override
  void initState() {
    super.initState();
    _isShowObscureIcon = widget.isObscure!;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly!,
      autofocus: widget.autofocus!,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: widget.isObscure == true
          ? InputDecoration(
              hintText: widget.hintText,
              labelText: widget.isMustBeEnter == true
                  ? "* ${widget.labelText}"
                  : widget.labelText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isShowObscureIcon = !_isShowObscureIcon;
                  });
                },
                icon: Icon(
                  _isShowObscureIcon == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 15,
                  color: AppColors.surfaceVariant,
                ),
              ),
            )
          : InputDecoration(
              hintText: widget.hintText,
              labelText: widget.isMustBeEnter == true
                  ? "* ${widget.labelText}"
                  : widget.labelText,
            ),
      validator: widget.validator,
      obscureText: _isShowObscureIcon,
      inputFormatters: widget.inputFormatters,
    );
  }
}
