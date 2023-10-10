import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

// 视频配置，秒
const videoDurationMin = 6;
const videoDurationMax = 900;

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

  static Future<List<AssetEntity>?> assets({
    required BuildContext context,
    List<AssetEntity>? selectId,
    RequestType type = RequestType.image,
    int maxAssets = 9,
    SpecialPickerType? specialPickerType,
    Widget? Function(BuildContext, AssetPathEntity?, int)? specialItemBuilder,
    SpecialItemPosition specialItemPosition = SpecialItemPosition.none,
  }) async {
    var privilege = await Privilege.photos();
    if (!privilege.result) {
      await ActionDialog.normal(
        context: context,
        content: Text(privilege.message),
        confirm: const Text('Setting'),
        cancel: const Text('Not allowed'),
        onConfirm: () => Privilege.openSettings(),
      );
      return null;
    }
    // ignore: use_build_context_synchronously
    var result = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        selectedAssets: selectId,
        requestType: type,
        maxAssets: maxAssets,
        themeColor: AppColors.surfaceVariant,
        specialPickerType: specialPickerType,
        filterOptions: FilterOptionGroup(
          orders: [
            const OrderOption(
              type: OrderOptionType.createDate,
            ),
          ],
          videoOption: const FilterOption(
              durationConstraint: DurationConstraint(
            min: Duration(seconds: videoDurationMin),
            max: Duration(seconds: videoDurationMax),
          )),
        ),
        specialItemPosition: specialItemPosition,
        specialItemBuilder: specialItemBuilder,
      ),
    );

    return result;
  }

  /// 相机
  static Future<AssetEntity?> camera({
    required BuildContext context,
    bool enableRecording = true,
  }) async {
    var privilege = await Privilege.camera();
    if (!privilege.result) {
      await ActionDialog.normal(
        context: context,
        content: Text(privilege.message),
        confirm: const Text('Setting'),
        cancel: const Text('Not allowed'),
        onConfirm: () => Privilege.openSettings(),
      );
      return null;
    }
    // ignore: use_build_context_synchronously
    var result = await CameraPicker.pickFromCamera(
      context,
      pickerConfig: CameraPickerConfig(
        enableRecording: enableRecording,
        enableAudio: enableRecording,
        textDelegate: enableRecording
            ? EnglishCameraPickerTextDelegateWithRecording()
            : EnglishCameraPickerTextDelegate(),
        resolutionPreset: ResolutionPreset.veryHigh,
      ),
    );
    return result;
  }
}
