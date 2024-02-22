import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/them.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(builder: (context, orientation) {
      return Container(
        height: orientation == Orientation.portrait ? 70 : 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.primary1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    height: 60,
                    // ignore: deprecated_member_use
                    color: AppColors.primary1,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
          
            ],
          ),
        ),
      );
    });
  }
}
