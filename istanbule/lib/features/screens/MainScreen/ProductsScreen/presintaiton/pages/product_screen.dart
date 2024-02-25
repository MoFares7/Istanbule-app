// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/productCard.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';
import 'package:istanbule/features/screens/widgets/loading_card.dart';

import '../../../../../Utils/them.dart';
import '../../../../widgets/searchTextField.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key});

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

  CartController cartController = Get.put(CartController());

  ProductController productController = Get.put(ProductController());
  List<Product> products = [];
  final ValueNotifier<bool> _isSearched = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    productController.productSerach(name: '');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: ValueListenableBuilder(
          valueListenable: _isSearched,
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SearchField(
                    onSearch: (value) async {
                      if (value != null) {
                        productController.productSerach(name: value.toString());
                        _isSearched.value = true;
                      } else {
                        _isSearched.value = false;
                        productController.productSerach(name: '');
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Obx(
                    () {
                      if (productController.productSearchState.result.isEmpty) {
                        return Center(
                          child: EmptyCard(
                              image: 'assets/icons/noData.svg',
                              title: 'Not found products',
                              width: 200,
                              isAbleToRefresh: true,
                              onRefresh: () {
                                productController.productSerach(name: '');
                              }),
                        );
                      }
                      if (productController.productSearchState.loading) {
                        return const Center(child: ShimmerCard());
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          productController.productSerach(name: '');
                        },
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          itemCount: productController
                              .productSearchState.result.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ProductCard(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.65,
                                width: MediaQuery.of(context).size.width / 1.4,
                                products: productController
                                    .productSearchState.result[index],
                                isOffer: false,
                                isLastOffer: false,
                                onAddToCart: (int quantity) {
                                  cartController.addToCart(CartItem(
                                    name: productController
                                        .productSearchState.result[index].name,
                                    image: productController.productSearchState
                                        .result[index].imgUrl,
                                    price: productController.productSearchState
                                        .result[index].price!,
                                    quantity: quantity,
                                  ));
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
