import 'package:flutter/cupertino.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_woo_commerce_getx_learn/common/api/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/continents_model/country.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/billing.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/order_model/shipping.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:get/get.dart';

class MyAddressController extends GetxController {
  // 地址类型 Billing 订单发票地址，Shipping 订单收货地址
  final String type = Get.arguments['type'] ?? "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // 输入框控制器
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController statesController = TextEditingController();

  // 大陆国家洲省
  List<ContinentsModel> continents = [];

  // 大陆国家数据
  List<Map<KeyValueModel, List<KeyValueModel>>> countriesList = [];

  // 国家选择
  List<int> countrySels = [];

  // 洲省数据
  List<KeyValueModel> statesList = [];

  // 洲省市选择
  List<int> statesSels = [];

  // 初始化
  Future<void> _initData() async {
    // 拉取 大陆国家数据
    await _fetchContinents();
    // 用户数据初始
    UserProfileModel profile = UserService.to.profile;
    if (type == "Billing") {
      firstNameController.text = profile.billing?.firstName ?? "";
      lastNameController.text = profile.billing?.lastName ?? "";
      postCodeController.text = profile.billing?.postcode ?? "";
      cityController.text = profile.billing?.city ?? "";
      address1Controller.text = profile.billing?.address1 ?? "";
      address2Controller.text = profile.billing?.address2 ?? "";
      companyController.text = profile.billing?.company ?? "";
      phoneNumberController.text = profile.billing?.phone ?? "";
      emailController.text = profile.billing?.email ?? "";
      countryController.text = profile.billing?.country ?? "";
      statesController.text = profile.billing?.state ?? "";
    } else {
      firstNameController.text = profile.shipping?.firstName ?? "";
      lastNameController.text = profile.shipping?.lastName ?? "";
      postCodeController.text = profile.shipping?.postcode ?? "";
      cityController.text = profile.shipping?.city ?? "";
      address1Controller.text = profile.shipping?.address1 ?? "";
      address2Controller.text = profile.shipping?.address2 ?? "";
      companyController.text = profile.shipping?.company ?? "";
      countryController.text = profile.shipping?.country ?? "";
      statesController.text = profile.shipping?.state ?? "";
    }
    // 国家代码
    String countryCode = countryController.text;

    // 国家选着器 - 选中 index
    for (var i = 0; i < continents.length; i++) {
      // 大陆
      var continent = continents[i];
      // 检查是否有选中的国家
      int iCountryIndex =
          continent.countries?.indexWhere((el) => el.code == countryCode) ?? 0;
      if (iCountryIndex > 0) {
        countrySels = [
          i,
          iCountryIndex,
        ];
        break;
      }
    }
    String statesCode = statesController.text;
    _filterStates(statesCode);
    // 洲省选择器 - 选中 index
    statesSels = [statesList.indexWhere((el) => el.key == statesCode)];
    update(["my_address"]);
  }

  // 拉取大陆国家洲省数据
  Future<void> _fetchContinents() async {
    continents = await UserApi.continents();
    countriesList = List.generate(continents.length, (index) {
      var entity = continents[index];
      List<KeyValueModel> countryList = [];
      for (Country country in entity.countries ?? []) {
        countryList.add(KeyValueModel<String>(
          key: country.code ?? "-",
          value: country.name ?? "-",
        ));
      }
      return {
        KeyValueModel<String>(
          key: entity.code ?? "-",
          value: entity.name ?? "-",
        ): countryList,
      };
    });
  }

  // 取洲省数据
  void _filterStates(String countryCode) {
    for (var i = 0; i < continents.length; i++) {
      var continent = continents[i];
      var country = continent.countries!
          .firstWhereOrNull((element) => element.code == countryCode);
      if (country != null) {
        statesList = List.generate(
          country.states?.length ?? 0,
          (index) {
            var state = country.states?.elementAt(index);
            return KeyValueModel<String>(
              key: state?.code ?? "-",
              value: state?.name ?? "-",
            );
          },
        );
        break;
      }
    }
  }

  // 国家选择
  void onCountryPicker() async {
    ActionBottomSheet.data(
      context: Get.context!,
      title: 'Country',
      onConfirm: (value) {
        if (value.isEmpty) return;
        if (value.length == 2) {
          countryController.text = '${value[1].key}';
          _filterStates(value[1].key); // 刷新洲数
        }
      },
      adapter: PickerDataAdapter<KeyValueModel<String>>(
        pickerdata: countriesList,
      ),
    );
  }

// 洲省市选择
  void onStatesPicker() async {
    ActionBottomSheet.data(
      context: Get.context!,
      onConfirm: (value) {
        if (value.isEmpty) return;
        statesController.text = '${value[0].key}';
      },
      adapter: PickerDataAdapter<KeyValueModel>(
        pickerdata: statesList,
      ),
      title: 'States',
      selecteds: statesSels,
    );
  }

  Future<void> onSave() async {
    if ((formKey.currentState as FormState).validate()) {
      UserProfileModel? profile;
      if (type == "Billing") {
        // 设置账单地址
        var req = Billing(
          email: emailController.text,
          phone: phoneNumberController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          postcode: postCodeController.text,
          city: cityController.text,
          address1: address1Controller.text,
          address2: address2Controller.text,
          company: companyController.text,
          country: countryController.text,
          state: statesController.text,
        );
        profile = await UserApi.saveBillingAddress(req);
      } else if (type == "Shipping") {
        // 设置送货地址
        var req = Shipping(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          postcode: postCodeController.text,
          city: cityController.text,
          address1: address1Controller.text,
          address2: address2Controller.text,
          company: companyController.text,
          country: countryController.text,
          state: statesController.text,
        );
        profile = await UserApi.saveShippingAddress(req);
      }
      if (profile != null) {
        UserService.to.setProfile(profile);
        Get.back<bool>(result: true);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    // 控制器释放
    firstNameController.dispose();
    lastNameController.dispose();
    postCodeController.dispose();
    cityController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    companyController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    countryController.dispose();
    statesController.dispose();
  }
}
