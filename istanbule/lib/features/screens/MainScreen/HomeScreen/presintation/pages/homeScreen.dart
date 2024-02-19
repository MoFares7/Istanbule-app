// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/services/product_api.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/offerCard.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/widgets/headerSection.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
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

  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    productController.getProducts();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: ResponsiveLayout(
            builder: (BuildContext context, Orientation orientation) {
          return Column(
            children: [
              Column(
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
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 7, left: 7, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Most Sold Products'.tr,
                            style: getTitleHomeFont(context),
                          ),
                          GetBuilder<CartController>(
                            builder: (cartController) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  itemCount: productController
                                      .productState.result.topProducts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 1),
                                      child: ProductCard(
                                        product: productController.productState
                                            .result.topProducts[index],
                                        onAddToCart: (int quantity) {
                                          cartController.addToCart(CartItem(
                                            name: products[index].name,
                                            image: products[index].image,
                                            price: products[index].price,
                                            quantity: quantity,
                                          ));
                                        },
                                        onAddToFavorites: () {
                                          cartController
                                              .addToFavorites(products[index]);
                                        },
                                        onRemoveToFavorites: () {
                                          cartController.removeFromFavorites(
                                              products[index]);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Most Offer Products'.tr,
                            style: getTitleHomeFont(context),
                          ),
                          GetBuilder<CartController>(
                            builder: (cartController) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  itemCount: productController
                                      .productState.result.topOffers.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 1),
                                      child: OfferCard(
                                        offer: productController.productState
                                            .result.topOffers[index],
                                        onAddToCart: (int quantity) {
                                          cartController.addToCart(CartItem(
                                            name: products[index].name,
                                            image: products[index].image,
                                            price: products[index].price,
                                            quantity: quantity,
                                          ));
                                        },
                                        onAddToFavorites: () {
                                          cartController
                                              .addToFavorites(products[index]);
                                        },
                                        onRemoveToFavorites: () {
                                          cartController.removeFromFavorites(
                                              products[index]);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
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

// class TopProductsList extends StatelessWidget {
//   const TopProductsList({
//     super.key,
//     required this.products,
//   });

//   // final List<Product> products;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CartController>(
//       builder: (cartController) {
//         return SizedBox(
//           height: MediaQuery.of(context).size.height / 1.8,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.all(
//               16,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
//                 child: ProductCard(
//                   product: products[index],
//                   onAddToCart: (int quantity) {
//                     // cartController.addToCart(CartItem(
//                     //   name: products[index].name,
//                     //   image: products[index].image,
//                     //   price: products[index].price,
//                     //   quantity: quantity,
//                     // ));
//                   },
//                   onAddToFavorites: () {
//                     cartController.addToFavorites(products[index]);
//                   },
//                   onRemoveToFavorites: () {
//                     cartController.removeFromFavorites(products[index]);
//                   },
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
