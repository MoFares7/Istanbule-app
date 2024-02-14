// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/headerSection.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/productCard.dart';
import 'package:marquee/marquee.dart';
import '../../../../../Utils/them.dart';
import '../../../../widgets/searchTextField.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  int calculateCrossAxisCount(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width >= 768
          ? 3
          : MediaQuery.of(context).size.width >= 321
          ? 2
          : 1;
    } else {
      return MediaQuery.of(context).size.width >= 992 ? 4 : 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: ResponsiveLayout(
          builder: (BuildContext context, Orientation orientation) {
        return SafeArea(
          child: Column(
            children: [
              orientation == Orientation.portrait
                  ? const HeaderSection()
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 7, left: 7, bottom: 2),
                child: SearchField(),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: calculateCrossAxisCount(context),
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                          childAspectRatio: .8),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: products[index],
                          onAddToCart: (int quantity) {
                            cartController.addToCart(CartItem(
                              name: products[index].name,
                              image: products[index].image,
                              price: products[index].price,
                              quantity: quantity,
                            ));
                          },
                          onAddToFavorites: () {
                            cartController.addToFavorites(products[index]);
                          },
                          onRemoveToFavorites: () {
                            cartController.removeFromFavorites(products[index]);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  List<Product> products = [
    Product(
      name: "Product 1",
      image: 'assets/images/food1.jpg',
      price: '200',
      oldPrice: '300',
      total: '811',
    ),
    Product(
      name: "Product 2",
      image: 'assets/images/food1.jpg',
      price: '600',
      oldPrice: '741',
      total: '146',
    ),
    Product(
      name: "Product 3",
      image: 'assets/images/food1.jpg',
      price: '680',
      oldPrice: '895',
      total: '146',
    ),
    Product(
      name: "Product 4",
      image: 'assets/images/food1.jpg',
      price: '680',
      oldPrice: '700',
      total: '146',
    ),
  ];

  final cartController = Get.put(CartController());
}
