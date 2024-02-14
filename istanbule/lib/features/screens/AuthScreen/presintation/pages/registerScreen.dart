// ignore_for_file: must_be_immutable

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/loginScreen.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/pair.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/passwordTextField.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/textField.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  final List<Pair> _list = [
    const Pair('Moscow', Icons.developer_board),
    const Pair('Saint Petersburg', Icons.deblur_sharp),
    const Pair('Nizhny Novgorod', Icons.money_off),
  ];

  Future<List<Pair>> _getFakeRequestData(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return _list.where((e) {
        return e.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary1,
      body: ResponsiveLayout(
        builder: (BuildContext context, Orientation orientation) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.black12, width: 1.0),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.textColorWhiteBold,
                            child: SvgPicture.asset(
                              'assets/icons/add-user.svg',
                              width: 120,
                              color: AppColors.primary1,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: RawMaterialButton(
                              onPressed: () async {
                                // final List<AssetEntity>? result =
                                //     await AssetPicker.pickAssets(
                                //   context,
                                //   pickerConfig: const AssetPickerConfig(),
                                // );
                              },
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              padding: const EdgeInsets.all(14.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.primary1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                   //   padding: EdgeInsets.only(bottom: 22),
                      // height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: AppColors.textColorWhiteBold,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8, top: 30 ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 40, bottom: 30, right: 10 , left: 10),
                                child: Text(
                                  'Create account in our platform'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.textColorBlackBold,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                              TextFormEditing(
                                labelText: "First Name".tr,
                                hintText: "First Name".tr,
                                onChanged: (value) {
                                  // authController.loginRequestModel.email = value;
                                },
                                // initialValue: authController.loginRequestModel.email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter an First Name".tr;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormEditing(
                                labelText: "Last Name".tr,
                                hintText: "Last Name".tr,
                                onChanged: (value) {
                                  // authController.loginRequestModel.email = value;
                                },
                                // initialValue: authController.loginRequestModel.email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter an Last Name".tr;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormEditing(
                                labelText: "Email".tr,
                                hintText: "myEmail@domain.com",
                                onChanged: (value) {
                                  // authController.loginRequestModel.email = value;
                                },
                                // initialValue: authController.loginRequestModel.email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter an email address".tr;
                                  } else {
                                    if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$',
                                    ).hasMatch(value.trim())) {
                                      return "Invalid email address".tr;
                                    }
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormEditing(
                                labelText: "Phone Number".tr,
                                hintText: "Phone Number".tr,
                                onChanged: (value) {
                                  // authController.loginRequestModel.email = value;
                                },
                                // initialValue: authController.loginRequestModel.email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a Phone Number".tr;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              PasswordFormFiled(
                                  labelText: 'Password'.tr,
                                  hintText: "*********",
                                  onChanged: (value) {
                                    // authController.loginRequestModel.password = value;
                                  },
                                  // initialValue:
                                  //     authController.loginRequestModel.password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter The Password".tr;
                                    }
                                    if (value.length < 8) {
                                      return "Password is Short".tr;
                                    }
                                    return null;
                                  },
                                  icon: Icons.lock),
                              const SizedBox(
                                height: 15,
                              ),
                              PasswordFormFiled(
                                  labelText: 'Confirm Password'.tr,
                                  hintText: "*********",
                                  onChanged: (value) {
                                    // authController.loginRequestModel.password = value;
                                  },
                                  // initialValue:
                                  //     authController.loginRequestModel.password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter The Password".tr;
                                    }
                                    if (value.length < 8) {
                                      return "Password is Short".tr;
                                    }
                                    return null;
                                  },
                                  icon: Icons.lock),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomDropdown<Pair>.searchRequest(
                                futureRequest: _getFakeRequestData,
                                hintText: 'City'.tr,
                                items: _list,
                                onChanged: (value) {
                                  print('changing value to: $value');
                                },
                                closedBorder: Border.all(
                                  color:
                                      Colors.black, // Choose your border color
                                  width: 1.0, // Choose your border width
                                ),
                              ),
                              const SizedBox(height: 16),
                              MainButton(
                                height: 50,
                                width: 200,
                                fontSize: 18,
                                color: AppColors.primary1,
                                titleButton: "Create account".tr,
                                titleButtonColor: AppColors.textColorWhiteBold,
                                onClickNext: () {
                                  if (!_formKey.currentState!.validate())
                                    return;
            
                                  // Get.to(const MainScreen());
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "you have an account".tr,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).dividerColor
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Login'.tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
