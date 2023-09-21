import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';

class ActionPicker {
  static Picker array({required PickerAdapter adapter, List<int>? selectId}) {
    return Picker(
      adapter: adapter,
      itemExtent: 40,
      height: 270,
      backgroundColor: Colors.transparent,
      containerColor: Colors.transparent,
      hideHeader: true,
      textStyle: TextStyle(
        fontSize: 18,
        height: 1.2,
        color: AppColors.secondary,
      ),
      selecteds: selectId,
    );
  }
}
