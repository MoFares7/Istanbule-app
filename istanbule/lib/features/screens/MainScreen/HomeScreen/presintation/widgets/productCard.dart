import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/pages/homeScreen.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/cartSheet.dart';
import 'package:marquee/marquee.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.product,
      this.onAddToCart,
      this.onAddToFavorites,
      this.onRemoveToFavorites});

  final Products product;
  final void Function(int)? onAddToCart;
  final VoidCallback? onAddToFavorites;
  final VoidCallback? onRemoveToFavorites;
  final ValueNotifier<bool> _isFavorit = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            // width: MediaQuery.of(context).size.width / 2 - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage(
                    product.imgUrl!,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('nameProduct'.tr, style: getTitleFont(context)),
                Text(
                  product.name!,
                  style: getHeadFont(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price'.tr, style: getTitleFont(context)),
                Text(product.price.toString(), style: getSupTitleFont(context)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'.tr, style: getTitleFont(context)),
                Text(product.quantity.toString(),
                    style: getSupTitleFont(context)),
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
                ValueListenableBuilder(
                  valueListenable: _isFavorit,
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        _isFavorit.value = !_isFavorit.value;
                        if (_isFavorit.value) {
                          onAddToFavorites?.call();
                        } else {
                          onRemoveToFavorites?.call();
                        }
                      },
                      child: Container(
                        height: 45,
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
                                _isFavorit.value
                                    ? 'Add to favorit'.tr
                                    : 'remove from favorit'.tr,
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
                  },
                ),
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
                    height: 45,
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
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
