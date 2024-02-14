import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';

class FavoritController extends GetxController {
  RxList<Product> favoritItem = <Product>[].obs;

  void addToFavorit(Product item) {
    favoritItem.add(item);
  }
}
