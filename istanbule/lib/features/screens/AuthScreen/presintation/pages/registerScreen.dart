// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/city.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/controller/user_controller.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/loginScreen.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/passwordTextField.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/textField.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.userApi;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary1,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ResponsiveLayout(
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
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                                backgroundColor: AppColors.textColorWhiteBold,
                                child: userController.userModel.image == null ||
                                        userController.userModel.image == ''
                                    ? SvgPicture.asset(
                                        'assets/icons/add-user.svg',
                                        width: 120,
                                        color: AppColors.primary1,
                                      )
                                    : ClipOval(
                                        child: Image.file(
                                          File(userController.userModel.image!),
                                          width: double.infinity,
                                          // height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: RawMaterialButton(
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    File file = File(result.files.single.path!);

                                    userController.userModel.image = file.path;

                                    Get.forceAppUpdate();
                                  } else {}
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
                  Form(
                    key: _formKey,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.textColorWhiteBold,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 30, right: 10, left: 10),
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
                                userController.userModel.name = value;
                              },
                              initialValue: userController.userModel.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter an First Name".tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormEditing(
                              labelText: "Email".tr,
                              hintText: "myEmail@domain.com",
                              onChanged: (value) {
                                userController.userModel.email = value;
                              },
                              initialValue: userController.userModel.email,
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
                              keyboardType: TextInputType.phone,
                              labelText: "Phone Number".tr,
                              hintText: "Phone Number".tr,
                              onChanged: (value) {
                                userController.userModel.phone = value;
                              },
                              initialValue: userController.userModel.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a Phone Number".tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            CustomDropdown(
                              hintText: 'City'.tr,
                              items:
                                  cityData.map((city) => city["name"]).toList(),
                              onChanged: (value) {
                                print('Changing value to: $value');
                              },
                              closedBorder: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            PasswordFormFiled(
                                labelText: 'Password'.tr,
                                hintText: "*********",
                                onChanged: (value) {
                                  userController.userModel.password = value;
                                },
                                initialValue: userController.userModel.password,
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
                                onChanged: (value) {},
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
                            const SizedBox(height: 16),
                            Obx(() {
                              if (userController.stateRegister.loading) {
                                return Center(
                                  child: LoadingAnimationWidget.discreteCircle(
                                    color: AppColors.primary1,
                                    size: 50,
                                  ),
                                );
                              } else {
                                return MainButton(
                                  height: 50,
                                  width: 200,
                                  fontSize: 18,
                                  color: AppColors.primary1,
                                  titleButton: "Create account".tr,
                                  titleButtonColor:
                                      AppColors.textColorWhiteBold,
                                  onClickNext: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await userController.sendRegister();
                                    }
                                  },
                                );
                              }
                            }),
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
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
