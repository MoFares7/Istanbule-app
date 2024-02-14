// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function()? onClickNext;
  final String? titleButton;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Color? titleButtonColor;
  const MainButton(
      {Key? key,
      this.onClickNext,
      this.titleButton,
      this.width,
      this.height,
      this.fontSize,
      this.color,
      this.titleButtonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: color),
            onPressed: () {
              onClickNext!();
            },
            child: Center(
                child: Center(
              child: Text(
                titleButton!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: titleButtonColor),
              ),
            ))),
      ),
    );
  }
}
