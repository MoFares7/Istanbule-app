import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istanbule/views/Utils/them.dart';
import 'package:istanbule/views/screens/AuthScreen/presintation/registerScreen.dart';
import 'package:istanbule/views/screens/AuthScreen/widgets/passwordTextField.dart';
import 'package:istanbule/views/screens/AuthScreen/widgets/textField.dart';
import 'package:istanbule/views/widgets/mainButton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  // final AuthController authController = Get.put(AuthController());
  RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    'assets/images/login.svg',
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height - 324,
                  decoration: const BoxDecoration(
                    color: AppColors.textColorWhiteBold,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 30),
                          child: Text(
                            'Login in our platform',
                            style: TextStyle(
                                color: AppColors.textColorBlackBold,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        TextFormEditing(
                          labelText: "Email",
                          hintText: "myEmail@domain.com",
                          onChanged: (value) {
                            // authController.loginRequestModel.email = value;
                          },
                          // initialValue: authController.loginRequestModel.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter an email address";
                            } else {
                              if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$',
                              ).hasMatch(value.trim())) {
                                return "Invalid email address";
                              }
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PasswordFormFiled(
                            labelText: 'Password',
                            hintText: "*********",
                            onChanged: (value) {
                              // authController.loginRequestModel.password = value;
                            },
                            // initialValue:
                            //     authController.loginRequestModel.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter The Password";
                              }
                              if (value.length < 8) {
                                return "Password is Short";
                              }
                              return null;
                            },
                            icon: Icons.lock),
                        const SizedBox(
                          height: 20,
                        ),
                        MainButton(
                          height: 50,
                          width: 200,
                          fontSize: 18,
                          color: AppColors.primary1,
                          titleButton: "Login",
                          titleButtonColor: AppColors.textColorWhiteBold,
                          onClickNext: () {
                            // Get.to(const MainScreen());
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MainButton(
                          height: 50,
                          width: 200,
                          fontSize: 18,
                          color: AppColors.primary1,
                          titleButton: "Login as Guest",
                          titleButtonColor: AppColors.textColorWhiteBold,
                          onClickNext: () {
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
                              "don't have account",
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
                                    builder: (context) => RegisterScreen(
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Create account',
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
        ),
      ),
    );
  }
}
