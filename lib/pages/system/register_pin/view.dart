import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/register_pin/index.dart';
import 'package:get/get.dart';

class RegisterPinPage extends GetView<RegisterPinController> {
  const RegisterPinPage({Key? key}) : super(key: key);

  Widget _buildForm() {
    return Form(
      key: controller.globalKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 提示文
        TextWidget.body1(LocaleKeys.registerPinFormTip.tr)
            .paddingBottom(20.w)
            .alignLeft(),
        PininputWidget(
          validator: controller.pinValidator,
          onSubmit: controller.onPinSubmit,
          controller: controller.pinController,
        ).paddingBottom(50.w),
        // 提交按钮
        ButtonWidget.primary(
          LocaleKeys.registerPinButton.tr,
          onTab: controller.onBtnSubmit,
        ).paddingBottom(AppSpace.listRow),

        // 返回按钮
        ButtonWidget.text(
          LocaleKeys.commonBottomCancel.tr,
          onTab: controller.onBtnBackup,
        ),
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        PageTitleWidget(
          title: LocaleKeys.registerPinTitle.tr,
          desc: LocaleKeys.registerPinDesc.tr,
        ),
        _buildForm().card(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPinController>(
      id: 'pin',
      init: RegisterPinController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("pin"),
          ),
          body: _buildView(),
        );
      },
    );
  }
}
