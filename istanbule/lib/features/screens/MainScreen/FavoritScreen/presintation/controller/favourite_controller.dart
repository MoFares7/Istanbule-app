import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/models/favourite_model.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/services/favourite_api.dart';
import 'package:rx_future/rx_future.dart';

class FavouriteController extends GetxController {
  FavouriteModel favouriteModel = FavouriteModel.zero();
  RxFuture<FavouriteModel> makeFavouriteState = RxFuture(FavouriteModel.zero());
  RxFuture<List<FavouriteModel>> favouriteState = RxFuture(<FavouriteModel>[]);
  FavouriteApi favouriteApi = FavouriteApi();

  Future<void> getFavourite() async {
    favouriteState.observe(
      (value) async {
        return await favouriteApi.getFavourite();
      },
      onSuccess: (value) {
        print("successfully fetch favourite products");
      },
      onError: (value) {
        print("error during fetch favourite products");
      },
    );
  }

  Future<void> makeFavourite(int? id) async {
    makeFavouriteState.observe((value) async {
      print("ssssssssssssssssss");
      return await favouriteApi.makeFavourites(id);
    }, onSuccess: (value) {
      print("dooooooooooo");
      print(value);
      Get.snackbar(
        'Success',
        'The Operation is successfully',
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.primary1,
        colorText: AppColors.textColorWhiteBold,
      );
    }, onError: (value) {
      print("errrrrrrr");
      print(value);
      Get.snackbar(
        'Error',
        'Failed to add to favorites',
        margin: const EdgeInsets.all(30),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.primary1,
        colorText: AppColors.textColorWhiteBold,
      );
    });
  }
}
