import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/data/models/favourite_model.dart';
import 'package:istanbule/features/screens/widgets/buySheet.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    this.favouite,
  });

  final FavouriteModel? favouite;

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
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(favouite!.imgUrl!.toString()),
                        fit: BoxFit.cover),
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
            MaterialButton(
              onPressed: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.primary1,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Text('Add to cart'.tr,
                            style: getButtonFont(context))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
