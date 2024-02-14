import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/Utils/them.dart';

import '../../../../../../core/model/cartModel.dart';
import '../../../../../Utils/styled.dart';

class RequestCard extends StatelessWidget {
   RequestCard(
      {super.key,
        required this.order
     });

 final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          //   height: 65,
          decoration: BoxDecoration(
              color: AppColors.textColorWhiteBold,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order number'.tr),
                  Text(order.id.toString()),
                ],
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.textColorWhiteBold,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('order status'.tr,
                                style: getTitleFont(context)),
                            Container(
                              //  margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: order.status
                                    ? Colors
                                    .lightGreen
                                    :  AppColors.primary1,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                order.statusTitle, // Replace with your offer percentage
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('number of products'.tr,
                                style: getTitleFont(context)),
                            Text('20', style: getSupTitleFont(context)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total price'.tr,
                                style: getTitleFont(context)),
                            Text('1800', style: getSupTitleFont(context)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('delivery status'.tr,
                                style: getTitleFont(context)),
                            Text('With delivery',
                                style: getSupTitleFont(context)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('order date'.tr, style: getTitleFont(context)),
                            Text('12/1/2024', style: getSupTitleFont(context)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
