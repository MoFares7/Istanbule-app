// // ignore_for_file: non_constant_identifier_names

// import '../apis/endPoint.dart';
// import '../model/managament_center_model/about_center_model.dart';
// import '../model/managament_center_model/center_search_model.dart';
// import '../model/managament_center_model/centers_model.dart';
// import '../network/http.dart';

// class CenterService {
//   Future<List<CenterModel>> getCenters() async {
//     Request request = Request(
//       EndPoints.getAllCenters,
//       RequestMethod.get,
//     );
//     Map<String, dynamic> response = await request.sendRequest();
//     return CenterModel.fromJsonList(response);
//   }
// }

// class CenterSortService {
//   Future<List<CenterSearchModel>> getCenterSearch({
//     String? centerName,
//     int? isFree,
//     int? cityId,
//     String? orderMode,
//   }) async {
//     Map<String, dynamic> queryParams = {};
//     if (centerName != null && centerName.isNotEmpty) {
//       queryParams['center_name'] = centerName;
//     }
//     if (isFree != null) {
//       queryParams['is_free'] = isFree;
//     }
//     if (cityId != null) {
//       queryParams['city_id'] = cityId;
//     }
//     if (orderMode != null) {
//       queryParams['order_mode'] = orderMode;
//     }
//       queryParams['order_by_column_name'] = "total_rate";
    

//     Request request = Request(
//       EndPoints.getAllCentersIsSearched,
//       RequestMethod.get,
//       queryParams: queryParams,
//     );

//     Map<String, dynamic> response = await request.sendRequest();
//     return CenterSearchModel.fromJsonList(response);
//   }
// }

// class AboutCenterService {
//   Future<List<CenterBasicInfoModel>> getAboutCenter({int? centerId}) async {
//     Map<String, dynamic> queryParams = {};

//     if (centerId != null) {
//       queryParams['center_id'] = centerId;
//     }

//     Request request = Request(
//       EndPoints.getAboutCenters,
//       RequestMethod.get,
//       queryParams: queryParams,
//     );
//     Map<String, dynamic> response = await request.sendRequest();
//     print('${response} thisssssssssssssss');
//     return CenterBasicInfoModel.fromJsonList(response);
//   }
// }
