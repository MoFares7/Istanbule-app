import 'package:flutter/material.dart';

import '../../Utils/them.dart';

class NextSlideButton extends StatelessWidget {
  final void Function() onClickNext;
  final String titleButton;
  final double width;
  const NextSlideButton(
      {Key? key,
      required this.onClickNext,
      required this.titleButton,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.2),
      child: SizedBox(
        width: width,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: AppColors.primary1),
            onPressed: () {
              onClickNext();
            },
            child: Center(
                child: Text(
              titleButton,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textColorWhiteBold),
            ))),
      ),
    );
  }
}
