import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/controllers/cart_controller.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/core/storage/storage.dart';
import 'package:istanbule/features/Utils/responsive.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/ads_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/manage_product_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/controller/product_controller.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/products_offers_section.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/presintation/widgets/products_top_section.dart';
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

  CartController cartController = Get.put(CartController());
  ProductController productController = Get.put(ProductController());
  List<Product> products = [];
  
  @override
  Widget build(BuildContext context) {
    productController.getProducts();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: ResponsiveLayout(
          builder: (BuildContext context, Orientation orientation) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: [
                        Obx(() {
                          return ListView.builder(
                            itemCount: productController
                                .productState.result.ads.length,
                            itemBuilder: (context, index) {
                              if (productController.productState.loading) {
                                return const Center(child: Text(""));
                              }
                              return AdsCard(
                                ad: productController
                                    .productState.result.ads[index],
                              );
                            },
                          );
                        }),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        // aspectRatio: 2.0,
                        initialPage: 2,
                        height: MediaQuery.of(context).size.height * 0.25,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 7, left: 7, bottom: 20),
                      child: SearchField(),
                    ),
                    Text(
                      'Most Sold Products'.tr,
                      style: getTitleHomeFont(context),
                    ),
                    ProductsTop(
                        productController: productController,
                        cartController: cartController,
                        products: products),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Most Offer Products'.tr,
                      style: getTitleHomeFont(context),
                    ),
                    ProductsOffters(
                        productController: productController,
                        cartController: cartController,
                        products: products),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}

class AdsCard extends StatelessWidget {
  const AdsCard({super.key, required this.ad});
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(ad.imgUrl.toString()), fit: BoxFit.contain),
      ),
    );
  }
}
