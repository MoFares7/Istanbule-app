import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/presintation/controller/favourite_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/offer_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/products_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/cartSheet.dart';
import 'package:marquee/marquee.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      this.products,
      this.offer,
      this.onAddToCart,
      required this.isOffer,
      this.productId,
      this.productOfferId,
      required this.width,
      required this.height,
      this.widthMarquee,
      required this.isLastOffer
      });

  final Products? products;
  final Offer? offer;
  final void Function(int)? onAddToCart;
  final bool isOffer;
  final bool isLastOffer;
  final int? productId;
  final int? productOfferId;
  final double? widthMarquee;
  final double width;
  final double height;

  FavouriteController favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          isOffer
              ? Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            isOffer ? offer!.imgUrl! : products!.imgUrl!,
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: const BoxDecoration(
                        color: AppColors.primary1,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${offer?.percentage ?? 0}%',
                          style: const TextStyle(
                              color: AppColors.textColorWhiteBold),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(
                              isOffer ? offer!.imgUrl! : products!.imgUrl!,
                            ),
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                  ],
                )
              : Container(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(
                          isOffer ? offer!.imgUrl! : products!.imgUrl!,
                        ),
                        fit: BoxFit.scaleDown),
                  ),
                ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isOffer ? 'nameoffer'.tr : 'nameproduct'.tr,
                    style: getTitleFont(context)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: 150,
                  child: Marquee(
                    text: isOffer ? offer!.offerName! : products!.name!,
                    scrollAxis: Axis.horizontal,
                    blankSpace: 80.0,
                    velocity: 25.0,
                    style: getHeadFont(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        isLastOffer ?  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price'.tr, style: getTitleFont(context)),
                Text(
                    
                         offer!.oldPrice!.toString(),
                        
                    style: getSupTitleFont(context)),
              ],
            ),
          ):
           Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price'.tr, style: getTitleFont(context)),
                      Text(
                          isOffer
                              ? offer!.price!.toString()
                              : products!.price!.toString(),
                          style: getSupTitleFont(context)),
                    ],
                  ),
                ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isOffer ? 'new price' : 'Total'.tr,
                    style: getTitleFont(context)),
                Text(
                  isOffer
                      ? (offer?.newPrice ?? 0).toString()
                      : (products?.quantity ?? 0).toString(),
                  style: getSupTitleFont(context),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Descibetion'.tr, style: getTitleFont(context)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: 150,
                  child: Marquee(
                    text: isOffer ? offer!.disc! : products!.disc!,
                    scrollAxis: Axis.horizontal,
                    blankSpace: 80.0,
                    velocity: 25.0,
                    style: getSupTitleFont(context),
                  ),
                ),
                // Text(
                //   isOffer
                //       ? offer!.disc!
                //       : products!.disc!,
                //   style: getSupTitleFont(context),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() {
                  if (favouriteController.makeFavouriteState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      favouriteController
                          .makeFavourite(isOffer ? productOfferId : productId);
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
                              'Add to favorit'.tr,
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
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
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
                            onAddToCart?.call(quantity);
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 6),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
