import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/storage/storage.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/loginScreen.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/registerScreen.dart';
import 'package:istanbule/features/screens/MainScreen/ProfileScreen/presintation/pages/my_request.dart';
import 'package:istanbule/features/screens/MainScreen/ProfileScreen/presintation/pages/offers_Screen.dart';
import 'package:istanbule/features/screens/MainScreen/ProfileScreen/presintation/widgets/logout_dialog.dart';
import 'package:istanbule/features/screens/MainScreen/ProfileScreen/presintation/widgets/selectCard.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';

import 'qr_codeScreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  LocalStorage localStorage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              localStorage.getToken() == null
                  ? Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/add-user.svg',
                          height: 150,
                          width: 300,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Register now easily'.tr,
                          style: getHeadFont(context),
                        ),
                        Text(
                          'Create a new account and make your life more effective and regular with us'
                              .tr,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textColorBlackRegular,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainButton(
                          height: 50,
                          width: 250,
                          titleButton: 'Create account'.tr,
                          color: AppColors.primary1,
                          titleButtonColor: AppColors.textColorWhiteBold,
                          onClickNext: () {
                            Get.to(RegisterScreen());
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: ExpansionTile(
                            maintainState: true,
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            backgroundColor: AppColors.textColorWhiteBold,
                            collapsedBackgroundColor:
                                AppColors.textColorWhiteBold,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            collapsedShape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            textColor: AppColors.textColorBlackRegular,
                            leading:
                                SvgPicture.asset('assets/icons/language.svg'),
                            title: Text('Language'.tr),
                            children: [
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        const Locale('ru');
                                        Get.updateLocale(const Locale('ru'));
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Russian'.tr,
                                          style: getTitleFont(context),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        const Locale('ar');
                                        Get.updateLocale(const Locale('ar'));
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Arabic'.tr,
                                          style: getTitleFont(context),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        const Locale('en');
                                        Get.updateLocale(const Locale('en'));
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'English'.tr,
                                          style: getTitleFont(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // Handle option selection
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SelectCard(
                title: 'Last offer'.tr,
                icon: 'assets/icons/order.svg',
                onTap: () {
                  Get.to(OffersScreen());
                },
              ),
              SelectCard(
                title: 'My Requests'.tr,
                icon: 'assets/icons/order.svg',
                onTap: () {
                  Get.to(MyRequestScreen());
                },
              ),
              SelectCard(
                title: 'Qr Code'.tr,
                icon: 'assets/icons/qr-code.svg',
                onTap: () {
                  Get.to(QRCodeScannerApp());
                },
              ),
              SelectCard(
                title: 'Logout'.tr,
                icon: 'assets/icons/logout.svg',
                onTap: () {
                  // localStorage.clearCache();
                  // Get.offAll(LoginScreen());
                  showDialog<bool>(
                    context: context,
                    builder: (ctx) =>  LogoutDialog(),
                  ).then((value) {
                    if (value != null && value) {
                      // Dispatch the logout event
                      return true;
                    }
                    return false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
