import 'package:get/get.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/models/favourite_model.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/services/favourite_api.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/manage_product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/services/product_api.dart';

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

  Future<void> makeFavourite(int id) async {
    makeFavouriteState.observe(
      (value) async {
        return await favouriteApi.makeFavourite(id);
      },
      onSuccess: (value) {
        print("successfully fetch favourite products");
      },
      onError: (value) {
        print("error during fetch favourite products");
      },
    );
  }
}
