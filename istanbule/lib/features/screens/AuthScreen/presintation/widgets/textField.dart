import 'package:flutter/material.dart';
import '../../../../Utils/them.dart';

class TextFormEditing extends StatelessWidget {
  TextFormEditing(
      {Key? key,
      this.height,
      this.width,
      required this.hintText,
      required this.validator,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.labelText,
      this.controller})
      : super(key: key);

  final String hintText;
  String? labelText;
  String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final void Function(dynamic)? onChanged;

  final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        cursorColor: AppColors.primary1,
        style: TextStyle(
          color: AppColors.textColorBlackRegular,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: isTablet ? 20 : 17,
            horizontal: 15,
          ),
          filled: true,
          fillColor: AppColors.textColorWhiteBold,
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(
            color: focusNode?.hasFocus == true
                ? AppColors.primary1 // Set label color to red when focused
                : AppColors
                    .textColorBlackRegular, // Set label color to black by default
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primary1),
          ),
        ),
      ),
    );
  }
}
