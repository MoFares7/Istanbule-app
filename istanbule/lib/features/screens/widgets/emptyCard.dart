import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/styled.dart';

class EmptyCard extends StatelessWidget {
  EmptyCard({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Not found products'.tr,
              style: getTitleFont(context),
            )
          ],
        ),
      ),
    );
  }
}
