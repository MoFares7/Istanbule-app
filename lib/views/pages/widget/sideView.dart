// ignore_for_file: unused_import
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:istanbule/views/pages/widget/itemSlidView.dart';

class SlideView extends StatelessWidget {
  final PageController? controller;
  const SlideView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: const [
        ItemSlideView(
            image: "assets/images/s1.svg",
            description:
                ('Purchase and payment can be made through select global payment gateways'),
            title: "Convenient payment"),
        ItemSlideView(
            image: "assets/images/s2.svg",
            description:
                ('You can purchase and choose the delivery process that suits you'),
            title: "Delivery Capability Goods"),
        ItemSlideView(
            image: "assets/images/s3.svg",
            description: ('Save time and effort by using our system'),
            title: "Shorten time and effort"),
      ],
    );
  }
}
