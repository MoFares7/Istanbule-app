import 'package:get/get.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/manage_product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/offer_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/products_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/services/product_api.dart';

import 'package:rx_future/rx_future.dart';

class ProductController extends GetxController {
  ProductModel productModel = ProductModel.zero();
  Offer offerModel = Offer.zero();

  RxFuture<ProductModel> productState = RxFuture(ProductModel.zero());

  RxFuture<List<Offer>> offerState = RxFuture(<Offer>[]);
  RxFuture<List<Products>> productSearchState = RxFuture(<Products>[]);
  ProductApi productApi = ProductApi();

  Future<void> getProducts() async {
    productState.observe(
      (value) async {
        return await productApi.getProducts();
      },
      onSuccess: (value) {
        productModel = value;
        print("successfully fetch products");
        print("this topProduct: " + '${productState.result.topProducts}');
      },
      onError: (value) {
        print("error during fetch products" + '${value}');
      },
    );
  }

  Future<void> productSerach({String? name}) async {
    productSearchState.observe(
      (value) async {
        return await productApi.productSearch(name: name);
      },
      onSuccess: (value) {
        // productModel = value;
      },
      onError: (value) {
        print("error during fetch products search" + '${value}');
      },
    );
  }

  Future<void> getOffers({String? best}) async {
    offerState.observe(
      (value) async {
        return await productApi.getOffers(best: best);
      },
      onSuccess: (value) {
        print("successfully fetch offers");
      },
      onError: (value) {
        print("error during fetch offers");
      },
    );
  }
}
