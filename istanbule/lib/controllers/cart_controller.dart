import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxList<Product> favoriteItems = <Product>[].obs;

  void addToCart(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  void addToFavorites(Product product) {
    favoriteItems.add(product);
  }

  void removeFromFavorites(Product product) {
    favoriteItems.remove(product);
  }
}
