import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';
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
          return Center(
            child: Lottie.asset("assets/lottie/looding.json", width: 50),
          );
        }
        if (productController.productState.result.topProducts.isEmpty) {
          return EmptyCard(
            title: "Not Found any Products yet",
            image: 'assets/icons/empty_product.svg',
            width: MediaQuery.of(context).size.width * 0.1,
          );
        }
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            itemCount: productController.productState.result.topProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                child: ProductCard(
             
                  products:
                      productController.productState.result.topProducts[index], 
                        isOffer: false,
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
      },
    );
  }
}
