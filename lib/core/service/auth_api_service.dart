// // ignore_for_file: unused_local_variable
// import 'package:TOGETHER/core/model/auth_model/register_operation_model.dart';

// import '../apis/endPoint.dart';
// import '../model/auth_model/login_operation_model.dart';
// import '../model/auth_model/user_model.dart';
// import '../model/auth_model/verify_code.dart';
// import '../network/http.dart';
// import '../storage/storage.dart';

// class AuthApi {
//   Future<RegisterRequestModel> resgister(
//       RegisterRequestModel registerRequestModel) async {
//     Request request = Request('auth/register-person-user', RequestMethod.post,
//         body: registerRequestModel.toJson(), isFormData: true);
//     Map<String, dynamic> response = await request.sendRequest();
//     return RegisterRequestModel.fromMap(response);
//   }

//   Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
//     Request request = Request('auth/login', RequestMethod.post,
//         body: loginRequestModel.toJson(), isFormData: true);
//     Map<String, dynamic> response = await request.sendRequest();
//     print('${response}' "respone login");
//     return LoginResponseModel.fromMap(response);
//   }

//   Future<void> logout() async {
//     LocalStorage localStorage = LocalStorage();
//     String? token = localStorage.getToken();
//     Request request = Request("auth/logout", RequestMethod.post,
//         body: {"acces_token": token});
//   }

//   Future<User> getMyUser({String? token}) async {
//     Map<String, dynamic> queryParams = {};
//     if (token != null) {
//       queryParams['token'] = token;
//     }
//     Request request = Request(EndPoints.getUserInfo, RequestMethod.get,
//         queryParams: queryParams);
//     Map<String, dynamic> response = await request.sendRequest();
//     return User.fromJson(response["data"]);
//   }

//   Future<void> code(VerifyCodeModel verifyCodeModel) async {
//     Request request = Request(
//       EndPoints.code,
//       RequestMethod.post,
//       body: verifyCodeModel.toJson(),
//     );
//     Map<String, dynamic> response = await request.sendRequest();
//   }
// }
