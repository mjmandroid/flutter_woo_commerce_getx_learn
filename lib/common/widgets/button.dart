import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

enum ButtonWidgetType {
  none, // 无
  primary, // 主按钮
  secondary, // 次按钮
  text, // 文字按钮
  icon, // 图标按钮
  textFilled, // 文字/填充
  textRoundFilled, // 文字/填充/圆形
  iconTextUpDown, // 图标/文字/上下
  iconTextOutlined, // 图标/文字/边框
  iconTextUpDownOutlined, // 图标/文字/上下/边框
  textIcon, // 文字/图标
}

class ButtonWidget extends StatelessWidget {
  final ButtonWidgetType type;

  final Function()? onTab;

  final String? text;

  final Widget? child;

  /// 图标
  final Widget? icon;

  final double? borderRadius;

  final Color? backgroundColor;

  /// 边框
  final Color? borderColor;

  final double? width;

  final double? height;

  const ButtonWidget({
    Key? key,
    this.type = ButtonWidgetType.none,
    this.onTab,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  const ButtonWidget.primary(
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.primary,
    this.width = double.infinity,
    this.height = 50,
    this.onTab,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
  }) : super(key: key);

  /// 次要
  const ButtonWidget.secondary(
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.secondary,
    this.width = double.infinity,
    this.height = 50,
    this.onTab,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
  }) : super(key: key);

  ButtonWidget.text(
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.text,
    this.onTab,
    Color? textColor,
    double? textSize,
    FontWeight? textWidget,
    this.borderRadius,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.height,
    this.width,
  })  : child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWidget,
        ),
        super(key: key);

  /// 图标
  const ButtonWidget.icon(
    this.icon, {
    Key? key,
    this.type = ButtonWidgetType.icon,
    this.onTab,
    this.text,
    this.borderRadius,
    this.backgroundColor,
    this.child,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// 文字/填充
  ButtonWidget.textFilled(
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.textFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTab,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        ),
        super(key: key);

  /// 文字/填充/圆形 按钮
  ButtonWidget.textRoundFilled(
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.textRoundFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTab,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        ),
        super(key: key);

  ButtonWidget.iconTextUpDown(
    this.icon,
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.textRoundFilled,
    Color? textColor,
    double? textSize,
    FontWeight? textWight,
    this.onTab,
    this.borderColor,
    this.borderRadius,
    this.backgroundColor,
    this.width,
    this.height,
  })  : child = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            TextWidget.button(
              text: text!,
              size: textSize,
              color: textColor ?? AppColors.onPrimaryContainer,
              weight: textWight,
            )
          ],
        ),
        super(key: key);

  /// 图标 / 文字 / 边框
  ButtonWidget.iconTextOutlined(
    this.icon,
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.iconTextOutlined,
    this.onTab,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = <Widget>[
          icon!.paddingRight(AppSpace.iconTextSmail),
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toRow(
          mainAxisSize: MainAxisSize.min,
        ),
        super(key: key);

  /// 图标 / 文字 / 上下 / 边框
  ButtonWidget.iconTextUpDownOutlined(
    this.icon,
    this.text, {
    Key? key,
    this.type = ButtonWidgetType.iconTextUpDownOutlined,
    this.onTab,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = <Widget>[
          icon!.paddingBottom(AppSpace.iconTextSmail),
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toColumn(
          mainAxisSize: MainAxisSize.min,
        ),
        super(key: key);

  /// 文字 / 图标
  ButtonWidget.textIcon(
    this.text,
    this.icon, {
    Key? key,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.type = ButtonWidgetType.textIcon,
    this.onTab,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = <Widget>[
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ).paddingRight(AppSpace.iconTextSmail),
          icon!,
        ].toRow(
          mainAxisSize: MainAxisSize.min,
        ),
        super(key: key);

  MaterialStateProperty<Color>? get _backgroundColor {
    switch (type) {
      case ButtonWidgetType.primary:
        return MaterialStateProperty.all(backgroundColor ?? AppColors.primary);
      default:
        return MaterialStateProperty.all(backgroundColor ?? Colors.transparent);
    }
  }

  MaterialStateProperty<BorderSide>? get _side {
    switch (type) {
      case ButtonWidgetType.secondary:
        return MaterialStateProperty.all(
            BorderSide(color: borderColor ?? AppColors.primary, width: 1));
      case ButtonWidgetType.iconTextOutlined:
      case ButtonWidgetType.iconTextUpDownOutlined:
        return MaterialStateProperty.all(BorderSide(
          width: 1,
          color: borderColor ?? AppColors.outline,
        ));
    }
    return null;
  }

  /// 阴影颜色
  MaterialStateProperty<Color>? get _overlayColor {
    switch (type) {
      case ButtonWidgetType.primary:
        return null;
      default:
        return MaterialStateProperty.all(AppColors.surfaceVariant);
    }
  }

  MaterialStateProperty<OutlinedBorder>? get _shape {
    switch (type) {
      case ButtonWidgetType.primary:
      case ButtonWidgetType.secondary:
        return MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? AppRadius.button))),
        );
      case ButtonWidgetType.textFilled:
      case ButtonWidgetType.iconTextOutlined:
      case ButtonWidgetType.iconTextUpDownOutlined:
        return MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius ?? AppRadius.buttonTextFilled)));
      case ButtonWidgetType.textRoundFilled:
        return MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0)));
    }
    return null;
  }

  // 子元素
  Widget? get _child {
    switch (type) {
      case ButtonWidgetType.primary:
        return TextWidget.button(
          text: text!,
          color: AppColors.onPrimary,
        );
      case ButtonWidgetType.secondary:
        return TextWidget.button(
          text: text!,
          color: AppColors.primary,
        );
      case ButtonWidgetType.icon:
        return icon;
      default:
        return child;
    }
  }

  // padding
  MaterialStateProperty<EdgeInsetsGeometry?>? get _padding {
    switch (type) {
      // case ButtonWidgetType.primary:
      // case ButtonWidgetType.secondary:
      //   return null;
      default:
        return MaterialStateProperty.all(EdgeInsets.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTab,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(0, 0)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: _backgroundColor,
          side: _side,
          overlayColor: _overlayColor,
          shape: _shape,
          padding: _padding,
        ),
        child: _child,
      ),
    );
  }
}
