import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/cartSheet.dart';
import 'package:marquee/marquee.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.product,
      this.onAddToCart,
      this.onAddToFavorites,
      this.onRemoveToFavorites});
  final Product product;
  // final VoidCallback? onAddToCart;
  final void Function(int)? onAddToCart;
  final VoidCallback? onAddToFavorites;
  final VoidCallback? onRemoveToFavorites;
  final ValueNotifier<bool> _isFavorit = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      width: MediaQuery.of(context).size.width / 2 - 20,
      decoration: BoxDecoration(
        color: AppColors.textColorWhiteBold,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Flexible(
            child: Container(
              // width: MediaQuery.of(context).size.width / 2 - 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/food1.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: getHeadFont(context),
              ),
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
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        _isFavorit.value
                            ? 'assets/icons/favorit-full.svg'
                            : 'assets/icons/favorit.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price'.tr, style: getTitleFont(context)),
                Text(product.price, style: getSupTitleFont(context)),
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
                Text(product.total, style: getSupTitleFont(context)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        onAddToCart?.call(quantity);
                      },
                    );
                  },
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Marquee(
                          text: 'Add to cart'.tr,
                          scrollAxis: Axis.horizontal,
                          blankSpace: 20.0,
                          velocity: 25.0,
                          style: getButtonFont(context),
                        ),
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
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
