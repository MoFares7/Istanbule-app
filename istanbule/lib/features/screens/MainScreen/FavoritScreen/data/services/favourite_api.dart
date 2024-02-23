import 'package:istanbule/core/apis/endPoint.dart';
import 'package:istanbule/core/network/http.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/models/favourite_model.dart';

class FavouriteApi {
  Future<List<FavouriteModel>> getFavourite() async {
    Request request =
        Request(EndPoints.getFavourite, RequestMethod.get, authorized: true);
    Map<String, dynamic> res = await request.sendRequest();
    return FavouriteModel.fromJsonList(res);
  }

  Future<FavouriteModel> makeFavourite(int? id) async {
    Request request = Request(
        "/toggleFavourite/$id",
        RequestMethod.get,
        authorized: true);
    Map<String, dynamic> response = await request.sendRequest();
    return FavouriteModel.fromJson(response);
  }
}
