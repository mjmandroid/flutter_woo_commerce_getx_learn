import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/colors.dart';
import 'package:pinput/pinput.dart';

class PininputWidget extends StatelessWidget {
  /// 提交事件
  final Function(String)? onSubmit;

  /// 焦点
  final FocusNode? focusNode;

  /// 文本编辑控制器
  final TextEditingController? controller;

  /// 验证函数
  final String? Function(String?)? validator;

  const PininputWidget({
    Key? key,
    this.onSubmit,
    this.focusNode,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.surfaceVariant),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          )),
    );

    /// 编辑
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(5),
    );

    ///完成
    final finishedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.surfaceVariant,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: finishedPinTheme,
      length: 6,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      autofocus: true,
      obscureText: true,
      keyboardAppearance: Brightness.light,
      focusNode: focusNode,
      controller: controller,
      onSubmitted: onSubmit,
    );
  }
}
