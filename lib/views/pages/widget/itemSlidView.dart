import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Column(
      children: [
        SizedBox(
          height: 1,
        ),
        Expanded(
          flex: 3,
          child: SvgPicture.asset(
            image,
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            width: 200,
            height: 250,
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.2, horizontal: 1),
                child: Container(
                  width: 380,
                  decoration: const BoxDecoration(
                      color: AppColors.textColorWhiteBold,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8, left: 8, top: 15),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
  }
}
