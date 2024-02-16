import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/controller/user_controller.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/registerScreen.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/passwordTextField.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/widgets/textField.dart';
import 'package:istanbule/features/screens/MainScreen/mainScreen.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key});

  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
  );
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    userController.userApi;
    return Scaffold(
      backgroundColor: AppColors.primary1,
      body: SafeArea(
        child: Center(
          child: ResponsiveLayout(
            builder: (BuildContext context, Orientation orientation) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: AspectRatio(
                            aspectRatio: orientation == Orientation.portrait
                                ? 7 / 3
                                : 5 / 1,
                            child: SvgPicture.asset(
                              'assets/images/login.svg',
                              //     height: 200,
                              //   width: double.infinity,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Form(
                        key: _formKey,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.textColorWhiteBold,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 30),
                                  child: Text(
                                    'Login in our platform'.tr,
                                    style: const TextStyle(
                                      color: AppColors.textColorBlackBold,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                TextFormEditing(
                                  labelText: "Phone Number".tr,
                                  hintText: "Phone Number".tr,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    userController.userModel.phone = value;
                                  },
                                  initialValue: userController.userModel.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a Phone Number".tr;
                                    }
                                  },
                                ),
                                const SizedBox(height: 15),
                                PasswordFormFiled(
                                  labelText: 'Password'.tr,
                                  hintText: "*********",
                                  onChanged: (value) {
                                    userController.userModel.password = value;
                                  },
                                  initialValue:
                                      userController.userModel.password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter The Password".tr;
                                    }
                                    if (value.length < 8) {
                                      return "Password is Short".tr;
                                    }
                                    return null;
                                  },
                                  icon: Icons.lock,
                                ),
                                const SizedBox(height: 20),
                                Obx(() {
                                  if (userController.stateLogin.loading) {
                                    return Center(
                                      child:
                                          LoadingAnimationWidget.discreteCircle(
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
                                      titleButton: "Login".tr,
                                      titleButtonColor:
                                          AppColors.textColorWhiteBold,
                                      onClickNext: () async {
                                        if (_formKey.currentState!
                                            .validate()) {}
                                        await userController.sendLogin();
                                      },
                                    );
                                  }
                                }),
                                const SizedBox(height: 5),
                                MainButton(
                                  height: 50,
                                  width: 200,
                                  fontSize: 18,
                                  color: AppColors.primary1,
                                  titleButton: "Login as Guest".tr,
                                  titleButtonColor:
                                      AppColors.textColorWhiteBold,
                                  onClickNext: () {
                                    Get.offAll(MainScreen());
                                    // Do something when the "Login as Guest" button is clicked
                                  },
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account".tr,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Create account'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
