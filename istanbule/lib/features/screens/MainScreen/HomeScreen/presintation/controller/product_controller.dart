import 'package:get/get.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/services/product_api.dart';

import 'package:rx_future/rx_future.dart';

class ProductController extends GetxController {
  ProductModel productModel = ProductModel.zero();

  RxFuture<ProductModel> productState = RxFuture(ProductModel.zero());
  ProductApi productApi = ProductApi();

  Future<void> getProducts() async {
    productState.observe(
      (value) async {
        return await productApi.getProducts();
      },
      onSuccess: (value) {
        productModel = value; // Update the productModel with the fetched data
        print("successfully fetch products");
        print("this topProduct: " + '${productState.result.topProducts}');
        print("this topProduct: " + '${productModel.topProducts}');
      },
      onError: (value) {
        print("error during fetch products");
      },
    );
  }
}
