// ignore_for_file: unused_import
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/pages/widget/itemSlidView.dart';

class SlideView extends StatelessWidget {
  final PageController? controller;
  const SlideView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children:  [
        ItemSlideView(
            image: "assets/images/s1.svg",
            description:
                ('Purchase and payment can be made through select global payment gateways'.tr),
            title: "Convenient payment".tr),
        ItemSlideView(
            image: "assets/images/s2.svg",
            description:
                ('You can purchase and choose the delivery process that suits you'.tr),
            title: "Delivery Capability Goods".tr),
        ItemSlideView(
            image: "assets/images/s3.svg",
            description: ('Save time and effort by using our system'.tr),
            title: "Shorten time and effort".tr),
      ],
    );
  }
}
