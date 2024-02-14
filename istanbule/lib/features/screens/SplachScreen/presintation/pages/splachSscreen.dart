import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/screens/SplachScreen/presintation/controller/splash_controller.dart';
import 'package:istanbule/features/Utils/them.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      splashController.checkToken();
    });
    return Scaffold(
      backgroundColor: AppColors.textColorWhiteBold,
      body: Center(
        child: Image.asset(
          'assets/images/LOGO.png',
          height: 400,
          width: 350,
        ),
      ),
    );
  }
}
