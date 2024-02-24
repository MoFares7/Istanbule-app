import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/model/cartModel.dart';
import '../../../../../Utils/styled.dart';
import '../../../../../Utils/them.dart';
import '../../../../widgets/main_Appbar.dart';
import '../widgets/requestCard.dart';

class MyRequestScreen extends StatelessWidget {
   MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleAppBar: 'My Requests'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                itemCount: order.length,
                itemBuilder: (context, index) {
                  return RequestCard(
                    order: order[index ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Order> order = [
    Order(id: 1, status: true, statusTitle: 'Delivered'),
    Order(id: 2, status: false, statusTitle: 'not Delivered'),
    Order(id: 3, status: true, statusTitle: 'Delivered'),
  ];
}
// Lottie.asset("assets/lottie/looding.json", width: 50),