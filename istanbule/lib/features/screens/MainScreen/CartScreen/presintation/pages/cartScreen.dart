import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/CartScreen/presintation/widget/cartCard.dart';
import 'package:istanbule/features/screens/MainScreen/ProductsScreen/presintaiton/pages/product_screen.dart';
import 'package:istanbule/features/screens/MainScreen/mainScreen.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';

import '../../../../widgets/searchTextField.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key, this.cartItems});

  final List<CartItem>? cartItems;
  final cartController = Get.put(CartController());
  final ValueNotifier<bool> _isSlected = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isSlectedAll = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        builder: (BuildContext context, Orientation orientation) {
          return ValueListenableBuilder(
              valueListenable: _isSlected,
              builder: (context, value, child) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  child: Obx(() {
                    var cartItems = cartController.cartItems;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  orientation == Orientation.portrait
                        const SizedBox(
                          height: 30,
                        ),
                        SearchField(),

                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: cartItems.isEmpty
                              ? Center(
                                  child: EmptyCard(
                                  image: 'assets/icons/empty.svg',
                                  title: 'Not found products',
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  isAbleToRefresh: true,
                                ))
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(8.0),
                                  itemCount: cartItems.length,
                                  itemBuilder: (context, index) {
                                    return CartCard(
                                      cartItem: cartItems[index],
                                      onTap: () {
                                        _isSlected.value = !_isSlected.value;
                                      },
                                    );
                                  },
                                ),
                        ),
                      ],
                    );
                  }),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary1,
          onPressed: () {
            Get.to(ProductScreen());
          },
          child: const Icon(Icons.add)),
    );
  }
}
