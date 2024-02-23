import 'package:istanbule/core/apis/endPoint.dart';
import 'package:istanbule/core/network/http.dart';
import 'package:istanbule/features/screens/AuthScreen/data/models/city_model.dart';
import 'package:istanbule/features/screens/AuthScreen/data/models/user_model.dart';

class UserApi {
  Future<UserModel> resgister(UserModel userModel) async {
    Request request = Request(EndPoints.register, RequestMethod.post,
        body: userModel.toJson(), isFormData: true);
    Map<String, dynamic> response = await request.sendRequest();
    return UserModel.fromMap(response);
  }

  Future<UserModel> login(UserModel userModel) async {
    Request request = Request(EndPoints.login, RequestMethod.post,
        body: userModel.toJson(), isFormData: true);
    Map<String, dynamic> response = await request.sendRequest();
    return UserModel.fromMap(response);
  }

  Future<List<CityModel>> getCities() async {
    Request request = Request(
      EndPoints.getCities,
      RequestMethod.get,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return CityModel.fromJsonList(response);
  }
}
