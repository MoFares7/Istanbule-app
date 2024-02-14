// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../Utils/them.dart';

class PasswordFormFiled extends StatefulWidget {
  PasswordFormFiled(
      {Key? key,
      required this.hintText,
      this.focusNode,
      this.labelText,
      required this.icon,
      required this.validator,
      this.initialValue,
      this.onChanged})
      : super(key: key);

  final String hintText;
  String? labelText;
  final IconData icon;
  String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final dynamic initialValue;
  final FocusNode? focusNode;

  @override
  State<PasswordFormFiled> createState() => _PasswordFormFiledState();
}

bool _isPasswordVision = true;

class _PasswordFormFiledState extends State<PasswordFormFiled> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return TextFormField(
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      obscureText: _isPasswordVision,
      validator: widget.validator,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      cursorColor: AppColors.textColorBlackRegular,
      style: TextStyle(
        color: AppColors.textColorBlackRegular, // Set the text color to black
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(
              _isPasswordVision ? Icons.visibility : Icons.visibility_off,
              size: 22,
              color: AppColors.textDark.withOpacity(0.6),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVision = !_isPasswordVision;
              });
            },
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.focusNode?.hasFocus == true
              ? AppColors.primary1 // Set label color to red when focused
              : AppColors
                  .textColorBlackRegular, // Set label color to black by default
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: 12,
          fontWeight: FontWeight.w400,
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
    );
  }
}
