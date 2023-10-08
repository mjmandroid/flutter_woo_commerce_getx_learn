import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/widgets/index.dart';

class BuildBillAddress extends StatelessWidget {
  final String? title, address, city, state, country, phone;

  const BuildBillAddress({
    Key? key,
    this.title,
    this.address,
    this.city,
    this.state,
    this.country,
    this.phone,
  }) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      // title
      TextWidget.title3(title ?? "").paddingBottom(AppSpace.listItem),

      // address
      IconTextWidget(
        icon: IconWidget.icon(
          Icons.storefront,
          size: 15,
        ),
        text: address,
      ).paddingBottom(AppSpace.listItem),

      // address, city, state, country
      IconTextWidget(
        icon: IconWidget.icon(
          Icons.location_on_outlined,
          size: 15,
        ),
        text: "$city, $state, $country",
      ).paddingBottom(AppSpace.listItem),

      // phone
      IconTextWidget(
        icon: IconWidget.icon(
          Icons.phone_in_talk,
          size: 15,
        ),
        text: phone,
      ),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
