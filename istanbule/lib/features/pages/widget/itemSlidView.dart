import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import '../../Utils/them.dart';

class ItemSlideView extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  const ItemSlideView(
      {Key? key, required this.image, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      builder: (context, orientation) {
        return Column(
          children: [
            const SizedBox(
              height: 1,
            ),
            Expanded(
              flex: orientation == Orientation.portrait ? 3 : 1,
              child: SvgPicture.asset(
                image,
                alignment: Alignment.center,
                fit: BoxFit.fitWidth,
                width: 200,
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.2, horizontal: 1),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.textColorWhiteBold,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, top: 15),
                            child: Align(
                              child: Text(
                                title!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: AppColors.textColorBlackBold,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.textColorBlackRegular,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 15),
                            child: Align(
                              child: Text(
                                description!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.textColorBlackRegular),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
