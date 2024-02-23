import 'package:get/get.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/manage_product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/offer_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/services/product_api.dart';

import 'package:rx_future/rx_future.dart';

class ProductController extends GetxController {
  ProductModel productModel = ProductModel.zero();
  Offer offerModel = Offer.zero();

  RxFuture<ProductModel> productState = RxFuture(ProductModel.zero());
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
        print("error during fetch products");
      },
    );
  }
}
