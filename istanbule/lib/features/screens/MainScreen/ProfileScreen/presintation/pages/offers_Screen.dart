import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/presintation/widgets/cardFavority.dart';
import 'package:istanbule/features/screens/widgets/main_Appbar.dart';
import 'package:istanbule/features/screens/widgets/searchTextField.dart';

import '../../../../../../controllers/cart_controller.dart';
import '../../../../../../core/model/cartModel.dart';
import '../../../../widgets/empty_card.dart';

class OffersScreen extends StatelessWidget {
  OffersScreen({super.key, });


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleAppBar: 'Last offer'.tr,
      ),
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      child:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // SearchField(),
            // SizedBox(height: 20,),
            // Expanded(
            //   child: ListView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     padding: const EdgeInsets.all(8.0),
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return ProductCard(
            //         product: products[index],
            //         isWidget: true,
            //         isOffer: true,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
