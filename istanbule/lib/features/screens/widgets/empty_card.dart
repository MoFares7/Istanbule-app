import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    super.key,
    this.image,
    this.title,
    this.height,
    this.width,
    this.onRefresh,
    required this.isAbleToRefresh,
  });

  final String? image;
  final String? title;
  final double? height;
  final double? width;
  final void Function()? onRefresh;
  final bool isAbleToRefresh;
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
              image!,
              height: height,
              width: width,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title!.tr,
              style: getTitleFont(context),
            ),
            const SizedBox(
              height: 10,
            ),
            isAbleToRefresh
                ? InkWell(
                    onTap: onRefresh,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1, horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Refresh'.tr,
                              style: getButtonFont(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
