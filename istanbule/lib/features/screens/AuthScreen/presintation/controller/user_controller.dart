import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/storage/storage.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/data/models/user_model.dart';
import 'package:istanbule/features/screens/AuthScreen/data/services/user_api.dart';
import 'package:istanbule/features/screens/AuthScreen/domain/entity/user.dart';
import 'package:istanbule/features/screens/MainScreen/mainScreen.dart';
import 'package:rx_future/rx_future.dart';

class UserController extends GetxController {
  //? initalize to data Regiester in model
  UserModel userModel = UserModel.zero();

  RxFuture<UserModel> stateLogin = RxFuture(UserModel.zero());

  RxFuture<UserModel> stateRegister = RxFuture(UserModel.zero());

  LocalStorage localStorage = LocalStorage();

  UserApi userApi = UserApi();

  Future<void> sendRegister() async {
    await stateRegister.observe(
      (value) async {
        return await userApi.resgister(userModel);
      },
      onSuccess: (value) {
        print("the accout is created" + '${value.message}');
        if (value.message == "email is taken") {
          Get.snackbar(
            'Error'.tr,
            'The email is already Found.'.tr,
            margin: const EdgeInsets.all(30),
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColors.primary1,
            colorText: AppColors.textColorWhiteBold,
          );
        } else {
          if (value.message == "phone number is taken") {
            Get.snackbar(
              'Error'.tr,
              'The Phone number is already Found.'.tr,
              margin: const EdgeInsets.all(30),
              snackPosition: SnackPosition.TOP,
              backgroundColor: AppColors.primary1,
              colorText: AppColors.textColorWhiteBold,
            );
          } else {
            Get.offAll(MainScreen());
          }
        }
      },
      onError: (value) {
        print('${value}  " regiser Error"');
      },
    );
  }

  Future<void> sendLogin() async {
    await stateLogin.observe(
      (value) async {
        return await userApi.login(userModel);
      },
      onSuccess: (value) {},
      onError: (value) {
        print('${value}  " login Error"');

        Get.snackbar(
          'Error'.tr,
          "Occurd error during login in app".tr,
          margin: const EdgeInsets.all(30),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary1,
          colorText: AppColors.textColorWhiteBold,
        );
      },
    );
  }
}
