// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/screens/MainScreen/CartScreen/presintation/pages/cartScreen.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/presintation/pages/favoritScreen.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/pages/homeScreen.dart';
import 'package:istanbule/features/screens/MainScreen/ProfileScreen/presintation/pages/profileScreen.dart';
import '../../Utils/them.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    final List<Widget> pages = [
      HomeScreen(),
      CartScreen(),
      FavoritScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (BuildContext context, int index, Widget? child) {
          return IndexedStack(
            index: index,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (BuildContext context, int index, Widget? child) {
          return ResponsiveLayout(
            builder: (BuildContext context, Orientation orientation) {
              return orientation == Orientation.portrait
                  ? Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0,
                              blurRadius: 10),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: BottomNavigationBar(
                          elevation: 10,
                          backgroundColor: AppColors.primary1,
                          iconSize: 20,
                          currentIndex: index,
                          type: BottomNavigationBarType.fixed,
                          showUnselectedLabels: false,
                          showSelectedLabels: true,
                          selectedFontSize: 11,
                          selectedIconTheme: const IconThemeData(
                            color: AppColors.primary1,
                            size: 25,
                          ),
                          selectedItemColor: AppColors.textColorWhiteBold,
                          selectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColorWhiteBold),
                          unselectedIconTheme: const IconThemeData(
                            color: AppColors.primary1,
                          ),
                          unselectedItemColor: AppColors.primary1,
                          items: [
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      currentIndex.value == 0
                                          ? "assets/icons/home.svg"
                                          : "assets/icons/home-ful.svg",
                                      height: 30,
                                      width: 33,
                                      color: AppColors.textColorWhiteBold,
                                    )
                                  ],
                                ),
                              ),
                              label: 'Home'.tr,
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      currentIndex.value == 1
                                          ? "assets/icons/cart.svg"
                                          : "assets/icons/cart-empty.svg",
                                      height: 30,
                                      width: 33,
                                      color: AppColors.textColorWhiteBold,
                                    )
                                  ],
                                ),
                              ),
                              label: 'Cart'.tr,
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      currentIndex.value == 2
                                          ? "assets/icons/star.svg"
                                          : "assets/icons/star-empty.svg",
                                      height: 30,
                                      width: 33,
                                      color: AppColors.textColorWhiteBold,
                                    )
                                  ],
                                ),
                              ),
                              label: 'Favorit'.tr,
                            ),
                            BottomNavigationBarItem(
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      currentIndex.value == 3
                                          ? "assets/icons/user.svg"
                                          : "assets/icons/user-empty.svg",
                                      height: 30,
                                      width: 33,
                                      color: AppColors.textColorWhiteBold,
                                    )
                                  ],
                                ),
                              ),
                              label: 'Account'.tr,
                            ),
                          ],
                          onTap: (int index) {
                            currentIndex.value = index;
                          },
                        ),
                      ),
                    )
                  : SizedBox();
            },
          );
        },
      ),
    );
  }
}
