import 'package:istanbule/core/apis/endPoint.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/core/network/http.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/manage_product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/offer_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/products_model.dart';

class ProductApi {
  Future<ProductModel> getProducts() async {
    Request request = Request(
      EndPoints.getProduct,
      RequestMethod.get,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return ProductModel.fromJson(response);
  }

  Future<List<Products>> productSearch({String? name}) async {
    Map<String, dynamic> body = {};
    if (name != null) {
      body['name'] = name;
    }
    Request request = Request(EndPoints.search, RequestMethod.post, body: body);
    Map<String, dynamic> response = await request.sendRequest();
    return Products.fromJsonListProduct(response);
  }

  Future<List<Products>> getAllProducts() async {
    Request request = Request(
      EndPoints.getAllProduct,
      RequestMethod.get,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return Products.fromJsonList(response);
  }

  Future<List<Offer>> getOffers({String? best}) async {
    Map<String, dynamic> body = {};
    if (best != null) {
      body['best'] = best;
    }

    Request request = Request(EndPoints.getOffers, RequestMethod.post,
        authorized: true, body: body);
    Map<String, dynamic> response = await request.sendRequest();
    return Offer.fromJsonList(response);
  }
}
