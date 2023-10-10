import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ProfileEditController extends GetxController {
  // 表单 form
  GlobalKey formKey = GlobalKey<FormState>();

  // 输入框控制器
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  // 本机图片file
  File? filePhoto;

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void _initData() {
    // 用户 profile
    UserProfileModel profile = UserService.to.profile;

    // 初始值
    firstNameController.text = profile.firstName ?? "";
    lastNameController.text = profile.lastName ?? "";
    emailController.text = profile.email ?? "";
    update(["profile_edit"]);
  }

  void onSelectPhoto() {
    ActionBottomSheet.popModal(
      context: Get.context,
      child: PickerImageWidget(
        onTapTake: (AssetEntity? result) async {
          if (result != null) {
            filePhoto = await result.file;
            update(["profile_edit"]);
          }
        },
        // 相册
        onTapAlbum: (List<AssetEntity>? result) async {
          if (result != null && result.isNotEmpty) {
            filePhoto = await result.first.file;
            update(["profile_edit"]);
          }
        },
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }
}
