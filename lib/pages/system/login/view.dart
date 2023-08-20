import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/login/index.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        TextFormWidget(
          autofocus: true,
          controller: controller.userNameController,
          labelText: LocaleKeys.registerFormName.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow),
        TextFormWidget(
          isObscure: true,
          controller: controller.passwordController,
          labelText: LocaleKeys.registerFormPassword.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validators.password(
              6,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "6", "max": "18"},
              ),
            ),
          ]),
        ).paddingBottom(AppSpace.listRow.w * 2),
        TextWidget.body1(LocaleKeys.loginForgotPassword.tr)
            .alignRight()
            .paddingBottom(50.w),
        ButtonWidget.primary(
          LocaleKeys.loginSignIn.tr,
          onTab: controller.onSign,
        ).paddingBottom(30.w),

        ///
        TextWidget.body1(LocaleKeys.loginOrText.tr).paddingBottom(30.w),

        ///
        <Widget>[
          ButtonWidget.iconTextOutlined(
            IconWidget.svg(AssetsSvgs.facebookSvg),
            'facebook',
            borderColor: AppColors.surfaceVariant,
            width: 149.w,
            height: 44.w,
          ),
          ButtonWidget.iconTextOutlined(
            IconWidget.svg(AssetsSvgs.googleSvg),
            "Google",
            borderColor: AppColors.surfaceVariant,
            width: 149.w,
            height: 44.w,
          ),
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        PageTitleWidget(
          title: LocaleKeys.loginBackTitle.tr,
          desc: LocaleKeys.loginBackDesc.tr,
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
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
