// ignore_for_file: file_names

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../Utils/them.dart';

class SlideIndicator extends StatelessWidget {
  final double dotIndex;
  const SlideIndicator({Key? key, required this.dotIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotIndex.toInt(),
      decorator: DotsDecorator(
        size: Size(28, 8),
        activeSize: Size(60, 8),
        color: const Color.fromARGB(255, 224, 218, 236),
        activeColor: AppColors.primary1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
