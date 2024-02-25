// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';
import 'package:istanbule/features/screens/widgets/loading_card.dart';
import 'package:istanbule/features/screens/widgets/main_Appbar.dart';
import 'package:lottie/lottie.dart';

class OffersScreen extends StatelessWidget {
  OffersScreen({
    super.key,
    this.products,
  });
  final List<Product>? products;
  CartController cartController = Get.put(CartController());
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    productController.getOffers(best: '');
    return Scaffold(
      appBar: MainAppBar(
        titleAppBar: 'Last offer'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () {
                  if (productController.offerState.result.isEmpty) {
                    return Center(
                      child: EmptyCard(
                          image: 'assets/icons/noData.svg',
                          title: 'Not found products',
                          width: 200,
                          isAbleToRefresh: true,
                          onRefresh: () {
                            productController.getOffers(best: '');
                          }),
                    );
                  }
                  if (productController.offerState.loading) {
                    return const Center(child: ShimmerCard());
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: productController.offerState.result.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ProductCard(
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          width: MediaQuery.of(context).size.width / 1.4,
                          offer: productController.offerState.result[index],
                          isOffer: true,
                          isLastOffer: true,
                          onAddToCart: (int quantity) {
                            if (productController.offerState.result.isNotEmpty) {
                              cartController.addToCart(CartItem(
                                name: productController
                                    .offerState.result[index].offerName,
                                image: productController
                                    .offerState.result[index].imgUrl,
                                price: productController
                                    .offerState.result[index].oldPrice,
                                quantity: quantity,
                              ));
                              if (index <
                                  productController.offerState.result.length) {}
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
