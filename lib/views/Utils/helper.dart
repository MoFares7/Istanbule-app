// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';

// import '../../logic/controllers/auth_controller.dart';
// import 'them.dart';

// class Domain {
//   static String imageDomain = "http://192.168.137.1";
// }

// class ThemeController extends GetxController {
//   // Whether the dark mode is enabled or not
//   RxBool isDarkMode = false.obs;

//   // Toggle the theme mode
//   void toggleTheme() {
//     isDarkMode.toggle();
//   }
// }

// class Helpers {
//   //! to check if can Login or not
//   Future<bool?> showNotLoggedInDialog(BuildContext context) {
//     return showDialog<bool>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Center(
//             child: Text(
//               ('you_are_not_logged_in'),
//               style: TextStyle(fontSize: 10.sp),
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // ADD IMAGE TO INICATE THAT USER IS NOT LOGGED IN
//               SizedBox(
//                   height: MediaQuery.of(context).size.height / 4,
//                   width: MediaQuery.of(context).size.width / 2,
//                   child: Lottie.asset('assets/login.json')),
//               const SizedBox(height: 20 * 0.5),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(true);
//                 },
//                 child: Row(
//                   children: [
//                     Text(
//                       ('login'),
//                       style: TextStyle(
//                           color: Theme.of(context).iconTheme.color,
//                           fontSize: 9.sp),
//                     ),
//                     const SizedBox(width: 20 * 0.5),
//                     Icon(Icons.login, color: Theme.of(context).iconTheme.color),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void showCheckDialog(BuildContext context, String text) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => AlertDialog(
//         elevation: 24,
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text(
//               ('Closed'),
//               style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.textDark,
//                   ),
//             ),
//           ),
//         ],
//         title: Text(
//           ('Warning'),
//           style: Theme.of(context)
//               .textTheme
//               .headline6!
//               .copyWith(fontWeight: FontWeight.w700),
//         ),
//         content: Text(
//           text,
//           style: Theme.of(context).textTheme.bodyText1,
//         ),
//       ),
//     );
//   }

//   void check(
//     BuildContext context,
//   ) {
//     showGeneralDialog(
//         barrierColor: Colors.black.withOpacity(0.5),
//         transitionBuilder: (context, a1, a2, widget) {
//           return Transform.scale(
//             scale: a1.value,
//             child: Opacity(
//               opacity: a1.value,
//               child: AlertDialog(
//                 shape: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16.0)),
//                 title: Center(
//                     child: Text(
//                   ('Warrning'),
//                   style: TextStyle(fontSize: 10.sp),
//                 )),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                         height: MediaQuery.of(context).size.height / 4,
//                         width: MediaQuery.of(context).size.width / 2,
//                         child: Lottie.asset('assets/lottie/noNet.json')),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Center(
//                         child: Text(
//                       ('no internet'),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 9.sp),
//                     )),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         transitionDuration: const Duration(milliseconds: 200),
//         barrierDismissible: true,
//         barrierLabel: '',
//         context: context,
//         pageBuilder: (context, animation1, animation2) {
//           return TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 ('Closed'),
//                 style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.textDark,
//                     ),
//               ),
//             ),
//           );
//         });
//   }

//   Future<dynamic> ShowDialogeDone(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//           content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//               height: MediaQuery.of(context).size.height / 4,
//               width: MediaQuery.of(context).size.width / 2,
//               child: Lottie.asset(
//                 'assets/done.json',
//               )),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Done'),
//           ),
//         ],
//       )),
//     );
//   }

//   void showLogOutDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Text(
//                 'Do you want to exit the application?'.tr,
//                 style: TextStyle(fontSize: 10.sp),
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () async {
//                       final AuthController authController =
//                           Get.put(AuthController());
//                       await authController.sendLogout();
//                     },
//                     child: Text('yes'.tr,
//                         style: TextStyle(
//                             fontSize: 9.sp,
//                             color: Theme.of(context).iconTheme.color))),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pop(context, false);
//                     },
//                     child: Text('no'.tr,
//                         style: TextStyle(
//                             fontSize: 9.sp,
//                             color: Theme.of(context).iconTheme.color)))
//               ],
//             ));
//   }
// }
