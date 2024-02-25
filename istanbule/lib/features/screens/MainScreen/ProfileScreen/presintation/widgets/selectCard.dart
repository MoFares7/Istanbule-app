import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';

class SelectCard extends StatelessWidget {
  SelectCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              color: AppColors.textColorWhiteBold,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: getTitleFont(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
