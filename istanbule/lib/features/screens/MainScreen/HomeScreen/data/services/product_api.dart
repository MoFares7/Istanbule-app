import 'package:istanbule/core/apis/endPoint.dart';
import 'package:istanbule/core/network/http.dart';
import 'package:istanbule/features/screens/AuthScreen/data/models/user_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/product_model.dart';

class ProductApi {
  Future<ProductModel> getProducts() async {
    Request request = Request(
      EndPoints.getProduct,
      RequestMethod.get,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return ProductModel.fromJson(response);
  }
}
