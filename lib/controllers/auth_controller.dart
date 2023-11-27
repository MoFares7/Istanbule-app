// import 'package:TOGETHER/core/model/auth_model/verify_code.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rx_future/rx_future.dart';
// import '../../core/model/auth_model/login_operation_model.dart';
// import '../../core/model/auth_model/register_operation_model.dart';
// import '../../core/model/auth_model/user_model.dart';
// import '../../core/routing/routing_manager.dart';
// import '../../core/service/auth_api_service.dart';
// import '../../core/storage/storage.dart';
// import '../../view/Utils/them.dart';
// import '../../view/screens/AuthScreen/SignUpScreen/opt_validate_screen.dart';
// import '../../view/screens/MainScreen/MainScreen.dart';

// class AuthController extends GetxController {
//   //? initalize to data Regiester in model
//   RegisterRequestModel registerRequestModel = RegisterRequestModel.zero();

//   LoginRequestModel loginRequestModel = LoginRequestModel.zero();

//   LoginResponseModel loginResponseModel = LoginResponseModel.zero();

//   RxFuture<LoginResponseModel> authState = RxFuture(LoginResponseModel.zero());

//   RxFuture<RegisterRequestModel> authStateRegister =
//       RxFuture(RegisterRequestModel.zero());

//   RxFuture<User> userInfoState = RxFuture(User.zero());

//   RxFuture<void> logoutState = RxFuture(null);

//   LocalStorage localStorage = LocalStorage();

//   AuthApi authApi = AuthApi();

//   Future<void> sendRegister() async {
//     await authStateRegister.observe(
//       (value) async {
//         return await authApi.resgister(registerRequestModel);
//       },
//       onSuccess: (value) {
//         verifyCodeModel.email = registerRequestModel.email;
//         Get.offAll(OtpVaildationScreen());
//       },
//       onError: (value) {
//         print('${value}  " regiser Error"');
//         if (value.toString() == "The email has already been taken.") {
//           Get.snackbar(
//             'Error'.tr,
//             'The email is already Found.'.tr,
//             margin: const EdgeInsets.all(30),
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: AppColors.primary1,
//             colorText: AppColors.textColorWhiteBold,
//           );
//         } else {
//           if (value.toString() == "The city id field is required.") {
//             Get.snackbar(
//               'Error'.tr,
//               "The City isn't Selected.".tr,
//               margin: const EdgeInsets.all(30),
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: AppColors.primary1,
//               colorText: AppColors.textColorWhiteBold,
//             );
//           } else {
//             Get.offAll(OtpVaildationScreen());
//           }
//         }
//       },
//     );
//   }

//   Future<void> sendLogin() async {
//     await authState.observe(
//       (value) async {
//         return await authApi.login(loginRequestModel);
//       },
//       onSuccess: (value) {
//         localStorage.saveToken(value.access_token);
//         print('${value.access_token}  " tokennnnnnnn"');
//         Get.offAll(const MainScreen());
//       },
//       onError: (value) {
//         // Handle login error...
//         print('${value}  " Login Error"');
//         if (value.toString() == "Unknown Error") {
//           // Show an error message for invalid email
//           Get.snackbar(
//             'Error'.tr,
//             'The email is invalid.'.tr,
//             margin: const EdgeInsets.all(30),
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: AppColors.primary1,
//             colorText: AppColors.textColorWhiteBold,
//           );
//         } else {
//           if (value.toString() == "you_are_not_authorized") {
//             Get.snackbar(
//               'Error'.tr,
//               'The password is invalid.'.tr,
//               margin: const EdgeInsets.all(30),
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: AppColors.primary1,
//               colorText: AppColors.textColorWhiteBold,
//             );
//           } else {
//             Get.snackbar(
//               'Error'.tr,
//               'occurred during the login process'.tr,
//               margin: const EdgeInsets.all(30),
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: AppColors.primary1,
//               colorText: AppColors.textColorWhiteBold,
//             );
//           }
//         }
//       },
//     );
//   }

//   Future<void> sendLogout() async {
//     await logoutState.observe(
//       (value) async {
//         await authApi.logout();
//       },
//       onSuccess: (value) {
//         localStorage.clearCache();

//         RoutingManager.to(RoutesName.login);
//       },
//     );
//   }

//   Future<void> getMyUser() async {
//     return await userInfoState.observe(
//       (value) async {
//         return await authApi.getMyUser(token: localStorage.getToken());
//       },
//       onSuccess: (value) {
//         print("dooooooooooooooooooooone");
//       },
//       onError: (p0) {
//         print("errrrrrrrrrrrrrrrrrrrrrrrrror");
//       },
//     );
//   }

//   RxFuture<void> codeState = RxFuture(null);
//   VerifyCodeModel verifyCodeModel = VerifyCodeModel.zero();
//   Future<void> code() async {
//     await codeState.observe(
//       (p0) async {
//         await authApi.code(verifyCodeModel);
//       },
//       onSuccess: (p0) {
//         sendLogin();
//       },
//     );
//   }
// }
