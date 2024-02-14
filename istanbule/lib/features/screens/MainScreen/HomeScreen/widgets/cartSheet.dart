// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/textField.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';

class CartSheet extends StatefulWidget {
  CartSheet({Key? key, required this.onAddToCart}) : super(key: key);

  final void Function(int)? onAddToCart;

  @override
  State<CartSheet> createState() => _CartSheetState();
}

class _CartSheetState extends State<CartSheet> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom / 2,
      ),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Please select the number of products you want'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textColorBlackBold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: Theme.of(context).hoverColor,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                child: TextFormEditing(
                  width: double.infinity,
                  hintText: 'number of pieces'.tr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "the field is required".tr;
                    }
                    return null;
                  },
                  controller: quantityController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                ),
              ),
              MainButton(
                height: 40,
                width: 300,
                titleButton: 'Add to cart'.tr,
                color: AppColors.primary1,
                titleButtonColor: AppColors.textColorWhiteBold,
                onClickNext: () {
                  int quantity = int.parse(quantityController.text);
                  widget.onAddToCart?.call(quantity);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
