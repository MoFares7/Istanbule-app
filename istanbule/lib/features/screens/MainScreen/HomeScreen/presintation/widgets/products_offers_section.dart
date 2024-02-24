import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';
import 'package:istanbule/features/screens/widgets/loading_card.dart';
import 'package:lottie/lottie.dart';

class ProductsOffters extends StatelessWidget {
  const ProductsOffters({
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
    return Obx(() {
      if (productController.productState.loading) {
        return const Center(child: ShimmerCard());
      }
      if (productController.productState.result.topOffers.isEmpty) {
        return Center(
          child: EmptyCard(
            image: 'assets/icons/empty_product.svg',
            title: "Not Found any Offers yet",
            width: MediaQuery.of(context).size.width * 0.1,
            isAbleToRefresh: true,
          ),
        );
      }
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.65,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(
            16,
          ),
          itemCount: productController.productState.result.topOffers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              child: ProductCard(
                offer: productController.productState.result.topOffers[index],
                productOfferId: productController
                    .productState.result.topOffers[index].productId,
                isOffer: true,
                onAddToCart: (int quantity) {
                  cartController.addToCart(CartItem(
                    name: products[index].name,
                    image: products[index].image,
                    price: products[index].price,
                    quantity: quantity,
                  ));
                },
              ),
            );
          },
        ),
      );
    });
  }
}
