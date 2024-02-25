import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';
import 'package:istanbule/features/screens/widgets/loading_card.dart';
import 'package:lottie/lottie.dart';

class ProductsTop extends StatelessWidget {
  const ProductsTop({
    super.key,
    required this.productController,
    required this.cartController,
    required this.products,
  });

  final ProductController productController;
  final CartController cartController;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (productController.productState.loading) {
          return const Center(child: ShimmerCard());
        }
        if (productController.productState.result.topProducts.isEmpty) {
          return EmptyCard(
            title: "Not Found any Products yet",
            image: 'assets/icons/empty_product.svg',
            width: MediaQuery.of(context).size.width * 0.1,
            isAbleToRefresh: true,
          );
        }
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.72,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            itemCount: productController.productState.result.topProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                child: ProductCard(
                  height: MediaQuery.sizeOf(context).height * 0.72,
                  width: MediaQuery.of(context).size.width / 1.4,
                  products:
                      productController.productState.result.topProducts[index],
                  productId: productController
                      .productState.result.topProducts[index].id,
                  isOffer: false,
                  isLastOffer: false,
                  onAddToCart: (int quantity) {
                    if (productController
                        .productState.result.topProducts.isNotEmpty) {
                      cartController.addToCart(CartItem(
                        name: productController
                            .productState.result.topProducts[index].name,
                        image: productController
                            .productState.result.topProducts[index].imgUrl,
                        price: productController
                            .productState.result.topProducts[index].price,
                        quantity: quantity,
                      ));
                      if (index <
                          productController
                              .productState.result.topProducts.length) {}
                    }
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
