import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/components/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/i18n/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({Key? key}) : super(key: key);

  Widget _buildAvatar() {
    return ListTileWidget(
      title: TextWidget.body1(LocaleKeys.profileEditMyPhoto.tr),
      trailing: [
        controller.filePhoto != null
            ? ImageWidget.file(
                controller.filePhoto?.path ?? "",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              )
            : ImageWidget.asset(
                'assets/icons/launcher_ios.png',
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              ),
      ],
      padding: EdgeInsets.all(AppSpace.card),
      onTap: controller.onSelectPhoto,
    ).card().height(90.h).paddingBottom(AppSpace.card);
  }

  //  profile 表单
  Widget _buildProfileForm() {
    return const Text("profile 表单");
  }

  //  password 表单
  Widget _buildPasswordForm() {
    return const Text("password 表单");
  }

  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头像
        _buildAvatar(),
        Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: <Widget>[
            // profile 表单
            _buildProfileForm(),
            // password 表单
            _buildPasswordForm(),
          ].toColumn(),
        ).paddingBottom(AppSpace.card),
        // 保存按钮
        ButtonWidget.primary(
          LocaleKeys.commonBottomSave.tr,
        ).paddingHorizontal(AppSpace.page),
      ].toColumn().padding(top: 45.h),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(),
      id: 'profile_edit',
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.profileEditTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
