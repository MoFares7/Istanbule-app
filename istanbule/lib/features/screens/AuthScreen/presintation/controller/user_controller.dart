import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/storage/storage.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/data/models/city_model.dart';
import 'package:istanbule/features/screens/AuthScreen/data/models/user_model.dart';
import 'package:istanbule/features/screens/AuthScreen/data/services/user_api.dart';
import 'package:istanbule/features/screens/MainScreen/mainScreen.dart';
import 'package:rx_future/rx_future.dart';

class UserController extends GetxController {
  UserModel userModel = UserModel.zero();

  RxFuture<UserModel> stateLogin = RxFuture(UserModel.zero());

  RxFuture<UserModel> stateRegister = RxFuture(UserModel.zero());

  RxFuture<List<CityModel>> stateCities = RxFuture(<CityModel>[]);

  LocalStorage localStorage = LocalStorage();

  UserApi userApi = UserApi();

  Future<void> sendRegister() async {
    await stateRegister.observe(
      (value) async {
        userModel.phone = '+${userModel.phone}';
        return await userApi.resgister(userModel);
      },
      onSuccess: (value) {
        if (kDebugMode) {
          ("the accout is created" '${value.message}');
        }
        userModel.phone = '${userModel.phone}';
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
            localStorage.saveToken(value.token.toString());
            Get.offAll(const MainScreen());
          }
        }
      },
      onError: (value) {
        userModel.phone = '${userModel.phone}';
        Get.snackbar(
          'Error'.tr,
          "Occurd error during Create Account".tr,
          margin: const EdgeInsets.all(30),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.primary1,
          colorText: AppColors.textColorWhiteBold,
        );
        if (kDebugMode) {
          print('$value  " regiser Error"');
        }
      },
    );
  }

  Future<void> sendLogin() async {
    await stateLogin.observe(
      (value) async {
        userModel.phone = '+${userModel.phone}';
        return await userApi.login(userModel);
      },
      onSuccess: (value) {
        localStorage.saveToken(value.token.toString());
        Get.offAll(const MainScreen());
      },
      onError: (value) {
        if (kDebugMode) {
          print('$value  " login Error"');
        }
        Get.snackbar(
          'Error'.tr,
          "Occurd error during login in app".tr,
          margin: const EdgeInsets.all(30),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.primary1,
          colorText: AppColors.textColorWhiteBold,
        );
      },
    );
  }

  Future<void> getCities() async {
    await stateCities.observe((value) async {
      return await userApi.getCities();
    }, onSuccess: (value) {
      print("cities is Fetched");
    }, onError: (value) {
      print("error when fetch cities ");
      print(value);
    });
  }
}
