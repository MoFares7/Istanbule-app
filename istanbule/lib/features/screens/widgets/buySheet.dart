// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/textField.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';

class BuySheet extends StatelessWidget {
  BuySheet({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Please select the way to payment'.tr,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: MaterialButton(
                        onPressed: () {},
                        child: SvgPicture.asset(
                          'assets/icons/cache.svg',
                          height: 100,
                          width: 60,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: MaterialButton(
                        onPressed: () {},
                        child: SvgPicture.asset(
                          'assets/icons/cache.svg',
                          height: 100,
                          width: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text('Cache'),
                      ),
                    ),
                    SizedBox(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text('Card'),
                      ),
                    ),
                  ],
                ),
                MainButton(
                  height: 40,
                  width: 300,
                  titleButton: 'Complete buy Operation',
                  color: AppColors.primary1,
                  titleButtonColor: AppColors.textColorWhiteBold,
                  onClickNext: () {
                    if (!_formKey.currentState!.validate()) {}
                  },
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
