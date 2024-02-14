import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/widgets/cardFavority.dart';
import 'package:istanbule/features/screens/widgets/emptyCard.dart';

class FavoritScreen extends StatelessWidget {
  FavoritScreen({Key? key, this.favoriteItems});

  final List<Product>? favoriteItems;
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Obx(() {
          var favoriteItems = cartController.favoriteItems;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: favoriteItems!.isEmpty
                    ? Center(
                        child: EmptyCard(
                        image: 'assets/icons/noData.svg',
                      ))
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(8.0),
                        itemCount: favoriteItems.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                              product: favoriteItems[index],
                              isWidget: false,
                              isOffer: false);
                        },
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
