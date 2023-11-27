import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:istanbule/views/Utils/them.dart';
import 'package:istanbule/views/screens/AuthScreen/presintation/loginScreen.dart';
import 'package:istanbule/views/screens/AuthScreen/widgets/pair.dart';
import 'package:istanbule/views/screens/AuthScreen/widgets/passwordTextField.dart';
import 'package:istanbule/views/screens/AuthScreen/widgets/textField.dart';
import 'package:istanbule/views/widgets/mainButton.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  List<Pair> _list = [
    Pair('Developer', Icons.developer_board),
    Pair('Designer', Icons.deblur_sharp),
    Pair('Consultant', Icons.money_off),
    Pair('Student', Icons.edit),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset('assets/icons/add-user.svg'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: RawMaterialButton(
                            onPressed: () {},
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
                  height: MediaQuery.of(context).size.height,
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
                        const Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 30),
                          child: Text(
                            'Create account in our platform',
                            style: TextStyle(
                                color: AppColors.textColorBlackBold,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormEditing(
                              width: 180,
                              labelText: "First Name",
                              hintText: "First Name",
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
                            TextFormEditing(
                              width: 180,
                              labelText: "Last Name",
                              hintText: "Last Name",
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
                          ],
                        ),
                        const SizedBox(
                          height: 15,
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
                          height: 15,
                        ),
                        PasswordFormFiled(
                            labelText: 'Confirm Password',
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.accent,
                          ),
                          child: Expanded(
                            child: CustomDropdown<Pair>.searchRequest(
                              futureRequest: _getFakeRequestData,
                              hintText: 'City',
                              items: _list,
                              onChanged: (value) {
                                print('changing value to: $value');
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        MainButton(
                          height: 50,
                          width: 200,
                          fontSize: 18,
                          color: AppColors.primary1,
                          titleButton: "Create account",
                          titleButtonColor: AppColors.textColorWhiteBold,
                          onClickNext: () {
                            if (!_formKey.currentState!.validate()) return;

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
                              "you have account",
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
                                'Login',
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
