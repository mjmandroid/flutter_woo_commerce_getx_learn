import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_widget.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class StylePage extends GetView<StylesIndexController> {
  const StylePage({Key? key}) : super(key: key);

  Widget _buildTextForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        TextFormWidget(
          keyboardType: TextInputType.emailAddress,
          controller: controller.unameController,
          labelText: "email",
        ),
        TextFormWidget(
          isObscure: true,
          controller: controller.pwdController,
          labelText: "password",
        ).marginOnly(bottom: 10),
        ButtonWidget.primary(
          "submit",
          onTab: () {
            if ((controller.formKey.currentState as FormState).validate()) {
              try {} finally {}
            }
          },
        ).tight(width: 100, height: 40),
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("form"),
          ),
          body: _buildTextForm().padding(all: 10),
        );
      },
    );
  }
}
