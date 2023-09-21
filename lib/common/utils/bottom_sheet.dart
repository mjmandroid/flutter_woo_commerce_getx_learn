import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'picker.dart';

class ActionBottomSheet {
  static Widget _buildHead({
    /// 标题
    String? title,

    /// 确认事件
    Function()? onConfirm,
  }) {
    return <Widget>[
      // title
      TextWidget.title2(title ?? '').expanded(),
      // done 按钮
      ButtonWidget.text(
        LocaleKeys.commonBottomApply.tr,
        onTab: onConfirm,
      ),
    ].toRow().padding(
          left: 10,
          right: 10,
          top: 10,
        );
  }

  /// 数据对话框
  static void data({
    /// 上下文 context
    required BuildContext context,

    /// 确认事件
    required Function(List value) onConfirm,

    /// 选取器数据适配器
    required PickerAdapter adapter,

    /// 标题
    String? title,

    /// 默认选中 [index]
    List<int>? selecteds,
  }) {
    var picker = ActionPicker.array(
      adapter: adapter,
      selectId: selecteds,
    );
    // 调用 标准模式框
    normal(
      context: context,
      contentPadding: const EdgeInsets.all(0),
      child: <Widget>[
        _buildHead(
          title: title,
          onConfirm: () {
            picker.doConfirm(context);
            onConfirm(picker.adapter.getSelectedValues());
          },
        ),
        // picker 内容
        picker.makePicker(),
      ].toColumn(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

// 标准 - 底部弹出 - 模式对话框
  static Future<void> normal({
    required BuildContext context,
    Widget? child,
    EdgeInsetsGeometry? contentPadding,
    bool enableDrag = true,
  }) async {
    return await showMaterialModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => SafeArea(
        minimum: const EdgeInsets.all(10),
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(
            milliseconds: 150,
          ),
          child: Container(
            padding: contentPadding ?? const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  static Future<void> barModal(
    Widget child, {
    BuildContext? context,
    double? padding,
    bool enableDrag = true,
  }) async {
    return await showBarModalBottomSheet(
      context: context ?? Get.context!,
      // 背景透明
      backgroundColor: Colors.transparent,
      // 启用拖拽
      enableDrag: enableDrag,
      // expand
      expand: false,
      builder: (context) => SafeArea(
        child: child,
      ),
    );
  }

  // 底部弹出 popModal
  static Future<void> popModal({
    BuildContext? context,
    required Widget child,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsets? safeAreaMinimum,
  }) async {
    return await showMaterialModalBottomSheet(
      context: context ?? Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) => SafeArea(
        minimum: safeAreaMinimum ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
