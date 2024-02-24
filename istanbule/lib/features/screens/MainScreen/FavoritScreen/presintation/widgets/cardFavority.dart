// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/models/favourite_model.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/presintation/controller/favourite_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/cartSheet.dart';
import 'package:lottie/lottie.dart';

class FavouriteCard extends StatelessWidget {
  FavouriteCard({super.key, this.favouite, this.productId});

  final FavouriteModel? favouite;
  FavouriteController favouriteController = Get.put(FavouriteController());
  final int? productId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textColorWhiteBold,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(favouite!.imgUrl!.toString()),
                        fit: BoxFit.scaleDown),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              favouite!.favouriteName!,
              style: getHeadFont(context),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price'.tr, style: getTitleFont(context)),
                  Text(favouite!.price!.toString(),
                      style: getSupTitleFont(context)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'.tr, style: getTitleFont(context)),
                  Text(favouite!.price.toString(),
                      style: getSupTitleFont(context)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              if (favouriteController.makeFavouriteState.loading) {
                return Lottie.asset("assets/lottie/looding.json", width: 50);
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () async {
                    favouriteController.makeFavourite(productId!);
                    favouriteController.getFavourite();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Remove to favorit'.tr,
                            // : 'remove from favorit'.tr,
                            style: getButtonFont(context),
                          ),
                          SvgPicture.asset(
                            'assets/icons/favorit.svg',
                            color: AppColors.textColorWhiteBold,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    builder: (_) {
                      return CartSheet(
                        onAddToCart: (int quantity) {
                          // onAddToCart?.call(quantity);
                        },
                      );
                    },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.cardDark),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Add to cart'.tr,
                          style: getButtonFont(context),
                        ),
                        SvgPicture.asset(
                          'assets/icons/cart.svg',
                          color: AppColors.textColorWhiteBold,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
