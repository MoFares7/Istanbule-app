import 'package:istanbule/core/apis/endPoint.dart';
import 'package:istanbule/core/network/http.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/manage_product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/offer_model.dart';

class ProductApi {
  Future<ProductModel> getProducts() async {
    Request request = Request(
      EndPoints.getProduct,
      RequestMethod.get,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return ProductModel.fromJson(response);
  }

  Future<List<Offer>> getOffers() async {
    Request request =
        Request(EndPoints.getOffers, RequestMethod.post, authorized: true);
    Map<String, dynamic> response = await request.sendRequest();
    return Offer.fromJsonList(response);
  }
}
