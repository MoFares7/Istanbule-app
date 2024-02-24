// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/presintation/controller/favourite_controller.dart';
import 'package:istanbule/features/screens/MainScreen/FavoritScreen/presintation/widgets/cardFavority.dart';
import 'package:istanbule/features/screens/widgets/empty_card.dart';
import 'package:istanbule/features/screens/widgets/loading_card.dart';
import 'package:lottie/lottie.dart';

class FavoritScreen extends StatelessWidget {
  FavoritScreen({
    Key? key,
  });

  FavouriteController favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    favouriteController.getFavourite();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Obx(
                  () {
                    if (favouriteController.favouriteState.result.isEmpty) {
                      return Center(
                        child: EmptyCard(
                          image: 'assets/icons/noData.svg',
                          title: 'Not found products',
                          width: MediaQuery.of(context).size.width * 0.5,
                          isAbleToRefresh: false,
                          onRefresh: () {
                            favouriteController.getFavourite();
                          },
                        ),
                      );
                    }
                    if (favouriteController.favouriteState.loading) {
                      return Center(
                        child: Lottie.asset("assets/lottie/looding.json",
                            width: 50),
                      );
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      itemCount:
                          favouriteController.favouriteState.result.length,
                      itemBuilder: (context, index) {
                        return FavouriteCard(
                          favouite:
                              favouriteController.favouriteState.result[index],
                          productId: favouriteController
                              .favouriteState.result[index].id,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary1,
        onPressed: () async {
          favouriteController.getFavourite();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
