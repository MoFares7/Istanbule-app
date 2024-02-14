import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/model/cartModel.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/widgets/buySheet.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.product, this.isWidget, this.isOffer});

  final Product? product;
  final bool? isWidget;
  final bool? isOffer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child:  Container(
        decoration: BoxDecoration(
          color: AppColors.textColorWhiteBold,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
          Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 140,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/food2.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            isOffer == true ?
            Transform.rotate(
              angle: 0.5,
              child: Container(
              //  margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary1, // You can customize the color
                  borderRadius: BorderRadius.circular(5),
                ),
              child: const Text(
                '30%', // Replace with your offer percentage
                style: TextStyle(color: Colors.white),
              ),
            ),
            ) :
                SizedBox(),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          product!.name,
          style: getHeadFont(context),
        ),


            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price'.tr, style: getTitleFont(context)),
                  Text(product!.price, style: getSupTitleFont(context)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            isWidget == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Old price'.tr, style: getTitleFont(context)),
                        Text(product!.oldPrice, style: getSupTitleFont(context)),
                      ],
                    ),
                  )
                : SizedBox(),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'.tr, style: getTitleFont(context)),
                  Text(product!.total.toString(),
                      style: getSupTitleFont(context)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {

              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.primary1,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text('Add to cart'.tr, style: getButtonFont(context))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
